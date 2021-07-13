package testcode.groovy;

import groovy.lang.GroovyClassLoader;
import groovy.lang.GroovyCodeSource;
import groovy.lang.GroovyShell;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URISyntaxException;

public class GroovyShellUsage {

    public static void test1(String uri, String file, String script) throws URISyntaxException, FileNotFoundException {
        GroovyShell shell = new GroovyShell();

        // ruleid:dangerous-groovy-shell
        shell.evaluate(new File(file));
        // ruleid:dangerous-groovy-shell
        shell.evaluate(new InputStreamReader(new FileInputStream(file)), "script1.groovy");
        // ruleid:dangerous-groovy-shell
        shell.evaluate(script);
        // ruleid:dangerous-groovy-shell
        shell.evaluate(script, "script1.groovy", "test");
        // ruleid:dangerous-groovy-shell
        shell.evaluate(new URI(uri));
        // ok:dangerous-groovy-shell
        shell.evaluate("hardcoded script");
    }

    public static void test2(String uri, String file, String script) throws URISyntaxException, FileNotFoundException {
        GroovyShell shell = new GroovyShell();

        // ruleid:dangerous-groovy-shell
        shell.parse(new File(file));
        // ruleid:dangerous-groovy-shell
        shell.parse(new InputStreamReader(new FileInputStream(file)), "test.groovy");
        // ruleid:dangerous-groovy-shell
        shell.parse(new InputStreamReader(new FileInputStream(file)));
        // ruleid:dangerous-groovy-shell
        shell.parse(script);
        // ruleid:dangerous-groovy-shell
        shell.parse(script, "test.groovy");
        // ruleid:dangerous-groovy-shell
        shell.parse(new URI(uri));

        String hardcodedScript = "test.groovy";
        // ok:dangerous-groovy-shell
        shell.parse(hardcodedScript);
    }

    public static void test3(String uri, String file, String script, ClassLoader loader) throws URISyntaxException, FileNotFoundException {
        GroovyClassLoader groovyLoader = (GroovyClassLoader) loader;

        // ruleid:dangerous-groovy-shell
        groovyLoader.parseClass(new GroovyCodeSource(new File(file)),false);
        // ruleid:dangerous-groovy-shell
        groovyLoader.parseClass(new InputStreamReader(new FileInputStream(file)), "test.groovy");
        // ruleid:dangerous-groovy-shell
        groovyLoader.parseClass(script);
        // ruleid:dangerous-groovy-shell
        groovyLoader.parseClass(script,"test.groovy");

        String hardcodedScript = "test.groovy";
        // ok:dangerous-groovy-shell
        shell.parse(hardcodedScript);
    }
}
