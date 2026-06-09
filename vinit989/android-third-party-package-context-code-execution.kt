import android.content.Context
import android.content.pm.PackageManager

// ruleid: android-third-party-package-context-code-execution
val packageContext = createPackageContext(
    packageName,
    Context.CONTEXT_INCLUDE_CODE or Context.CONTEXT_IGNORE_SECURITY
)

// ruleid: android-third-party-package-context-code-execution
val ctx = createPackageContext(
    packageName,
    Context.CONTEXT_IGNORE_SECURITY or Context.CONTEXT_INCLUDE_CODE
)

// ok: android-third-party-package-context-code-execution
val pm = context.packageManager
if (pm.checkSignatures(packageName, context.packageName) == PackageManager.SIGNATURE_MATCH) {
    val safeCtx = createPackageContext(packageName, 0)
}