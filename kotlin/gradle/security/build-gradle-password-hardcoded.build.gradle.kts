import org.gradle.api.tasks.testing.logging.TestExceptionFormat
import org.gradle.api.tasks.testing.logging.TestLogEvent
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    val kotlinVersion = "1.8.0"

    id("org.springframework.boot") version "3.1.1"
    id("io.spring.dependency-management") version "1.1.0"
    id("io.gitlab.arturbosch.detekt") version "1.22.0"
    kotlin("jvm") version kotlinVersion
    kotlin("plugin.spring") version kotlinVersion
    id("org.sonarqube") version "3.0"
    id("org.springdoc.openapi-gradle-plugin") version "1.6.0"
    jacoco
    application
}

group = "test"
version = "latest"

val javaVersion = "17"
val koTestVersion = "5.5.5"
val mockkVersion = "1.13.4"
val runDetekt = !project.hasProperty("noDetekt")

val file = File("$rootDir/.git")
val gitDir = if (file.isFile) "$rootDir/${file.readText().split(": ").last().trim()}" else "$rootDir/.git"

java {
    sourceCompatibility = JavaVersion.VERSION_17
}

repositories {
    if (System.getProperty("build-in-runner")?.toBoolean() == true) {
        maven {
            url = uri("https://art.test.test/artifactory/maven/")
        }
    } else {
        mavenLocal()
        mavenCentral()
    }
    maven {
        val env = System.getenv()

        url = uri(env["LIBRARY_URL"] ?: "https://art.test.test/artifactory/maven-some-dev")
        credentials {
            username = env["LIBRARY_USER_1"] ?: "maven-first-dev"
            // ruleid: build-gradle-password-hardcoded
            password = env["LIBRARY_PASS_1"] ?: "jWnyxxxxxxxxxxX7ZQxxxxxxxx"
 
            username = env["LIBRARY_USER_2"] ?: "maven-second-dev"
            // ok: build-gradle-password-hardcoded
            password = env["LIBRARY_PASS_2"] 
        }
    }
}

dependencyManagement {
    imports {
        mavenBom("de.codecentric:spring-boot-admin-dependencies:3.2.1")
    }
}

dependencies {
    detektPlugins("io.gitlab.arturbosch.detekt:detekt-formatting:1.22.0")

    implementation("org.springframework.boot:spring-boot-starter-data-jpa")
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
    implementation("org.jetbrains.kotlin:kotlin-reflect")
    implementation("org.liquibase:liquibase-core")
    implementation("org.springframework.kafka:spring-kafka")
    implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.2.0")
    implementation("de.codecentric:spring-boot-admin-starter-client")
    implementation("org.springframework.boot:spring-boot-starter-actuator")
    implementation("io.github.microutils:kotlin-logging-jvm:3.0.5")

    runtimeOnly("org.postgresql:postgresql")

    testImplementation("org.springframework.boot:spring-boot-starter-test") {
        exclude(module = "mockito-core")
        exclude(module = "mockito-junit-jupiter")
    }
    testImplementation("org.springframework.kafka:spring-kafka-test")
    testImplementation("com.ninja-squad:springmockk:4.0.0")
    testImplementation("io.kotest.extensions:kotest-extensions-spring:1.1.2")
    testImplementation("io.kotest:kotest-runner-junit5-jvm:$koTestVersion")
    testImplementation("io.kotest:kotest-assertions-core-jvm:$koTestVersion")
    testImplementation("io.kotest.extensions:kotest-extensions-embedded-kafka:1.0.6")
    testImplementation("org.instancio:instancio-core:2.11.0")
    testImplementation("io.kotest.extensions:kotest-extensions-wiremock:2.0.0")

    testRuntimeOnly("com.h2database:h2")
}

application {
    mainClass.set("someKt.someKtYeah")
}

kotlin {
    jvmToolchain {
        languageVersion.set(JavaLanguageVersion.of(javaVersion))
    }
}

jacoco {
    toolVersion = "0.8.7"
}

detekt {
    buildUponDefaultConfig = true
    autoCorrect = true
    allRules = false // activate all available (even unstable) rules.
    config = files("$projectDir/config/config.yml")
}

tasks {
    jacocoTestReport {
        dependsOn(test)
        reports {
            xml.required.set(true)
        }
        classDirectories.setFrom(
            files(classDirectories.files.map {
                fileTree(it) {
                    exclude(
                        "**/config/*",
                        "**/constants/*",
                        "**/controller/*",
                        "**/domain/*",
                        "**/exception/*",
                        "**/SomeServiceBell.kt",
                    )
                }
            })
        )
    }

    withType<io.gitlab.arturbosch.detekt.Detekt> {
        configureEach {
            jvmTarget = javaVersion
        }
        onlyIf { runDetekt }
    }

    withType<io.gitlab.arturbosch.detekt.DetektCreateBaselineTask> {
        configureEach {
            jvmTarget = javaVersion
        }
        onlyIf { runDetekt }
    }

    withType<Test> {
        configureEach {
            useJUnitPlatform()
        }
        testLogging {
            exceptionFormat = TestExceptionFormat.FULL
            events = setOf(TestLogEvent.FAILED, TestLogEvent.STANDARD_ERROR)
        }
        finalizedBy(jacocoTestReport)
    }

    withType<KotlinCompile> {
        kotlinOptions {
            freeCompilerArgs += "-Xjsr305=strict"
            jvmTarget = javaVersion
        }
    }

    val installGitHooksName = "installGitHooks"

    val copyGitHooks = register<Copy>("copyGitHooks") {
        description = "Copies the git hooks from $gitDir/hooks to the .git folder."
        from("$rootDir/hooks/") {
            include("pre-commit.sh")
            rename("(.*).sh", "$1")
        }
        into("$gitDir/hooks")
        onlyIf { runDetekt }
        finalizedBy(installGitHooksName)
    }

    register<Exec>(installGitHooksName) {
        description = "Installs the pre-commit git hooks from $gitDir/hooks."
        group = "git hooks"
        commandLine("chmod")
        args("+x", "$gitDir/hooks/pre-commit")
        onlyIf { !org.jetbrains.kotlin.cli.common.isWindows && runDetekt }
        outputs.upToDateWhen { copyGitHooks.get().state.upToDate }
        doLast {
            println("Git hook installed successfully.")
        }
    }

    afterEvaluate {
        assemble {
            dependsOn(copyGitHooks)
        }
    }
}

springBoot {
    buildInfo()
}