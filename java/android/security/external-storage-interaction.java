package oversecured.ovaa.utils;

import android.content.Context;
import android.net.Uri;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.p008io.IOUtils;

/* loaded from: classes.dex */
public class FileUtils {
    private FileUtils() {
    }

    public static void deleteRecursive(File file) {
        File[] listFiles;
        if (file.isDirectory()) {
            for (File child : file.listFiles()) {
                deleteRecursive(child);
            }
        }
        file.delete();
    }

    public static File copyToCache(Context context, Uri uri) {
        try {
            File out = new File(context.getExternalCacheDir(), "" + System.currentTimeMillis());
            InputStream i = context.getContentResolver().openInputStream(uri);
            OutputStream o = new FileOutputStream(out);
            IOUtils.copy(i, o);
            i.close();
            o.close();
            return out;
        } catch (Exception e) {
            return null;
        }
    }

    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        File file = new File(Environment.getExternalStorageDirectory(), uri.getLastPathSegment());
        return ParcelFileDescriptor.open(file, 805306368);
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
}