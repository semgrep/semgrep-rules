package security;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.commons.io.FilenameUtils;

public class Cls {

    // CVE-2022-39367 shape: archive entry name flows into new File and FileOutputStream
    public void extractZip(ZipInputStream zipInputStream, File importSandboxDirectory) throws Exception {
        ZipEntry zipEntry;
        while ((zipEntry = zipInputStream.getNextEntry()) != null) {
            // ruleid:archive-entry-path-traversal
            final File destFile = new File(importSandboxDirectory, zipEntry.getName());
            // ruleid:archive-entry-path-traversal
            final FileOutputStream destOutputStream = new FileOutputStream(destFile);
            destOutputStream.close();
        }
    }

    // JarEntry variant of the same shape
    public void extractJar(JarInputStream jarInputStream, File outDir) throws Exception {
        JarEntry jarEntry;
        while ((jarEntry = jarInputStream.getNextJarEntry()) != null) {
            // ruleid:archive-entry-path-traversal
            final File destFile = new File(outDir, jarEntry.getName());
            // ruleid:archive-entry-path-traversal
            final FileOutputStream destOutputStream = new FileOutputStream(destFile);
            destOutputStream.close();
        }
    }

    // Chained getNextEntry().getName() without an intermediate variable
    public void extractZipChained(ZipInputStream zipInputStream, File outDir) throws Exception {
        // ruleid:archive-entry-path-traversal
        File destFile = new File(outDir, zipInputStream.getNextEntry().getName());
        destFile.createNewFile();
    }

    // Chained getNextJarEntry().getName() without an intermediate variable
    public void extractJarChained(JarInputStream jarInputStream, File outDir) throws Exception {
        // ruleid:archive-entry-path-traversal
        File destFile = new File(outDir, jarInputStream.getNextJarEntry().getName());
        destFile.createNewFile();
    }

    // Entry name propagated through a variable into Path.resolve
    public void extractWithResolve(ZipInputStream zipInputStream, Path outDir) throws Exception {
        ZipEntry entry = zipInputStream.getNextEntry();
        String entryName = entry.getName();
        // ruleid:archive-entry-path-traversal
        Path target = outDir.resolve(entryName);
        Files.createDirectories(target.getParent());
    }

    // Entry name reaching Files.write through Paths.get
    public void extractWithFilesWrite(ZipInputStream zipInputStream, String outDir, byte[] content) throws Exception {
        ZipEntry entry = zipInputStream.getNextEntry();
        String entryName = entry.getName();
        // ruleid:archive-entry-path-traversal
        Files.write(Paths.get(outDir, entryName), content);
    }

    // Entry name reaching Files.newOutputStream through Paths.get
    public void extractWithNewOutputStream(ZipInputStream zipInputStream, String outDir) throws Exception {
        ZipEntry entry = zipInputStream.getNextEntry();
        String entryName = entry.getName();
        // ruleid:archive-entry-path-traversal
        Files.newOutputStream(Paths.get(outDir, entryName));
    }

    // Entry name reaching Files.copy through Paths.get
    public void extractWithFilesCopy(ZipInputStream zipInputStream, String outDir, InputStream content) throws Exception {
        ZipEntry entry = zipInputStream.getNextEntry();
        String entryName = entry.getName();
        // ruleid:archive-entry-path-traversal
        Files.copy(content, Paths.get(outDir, entryName));
    }

    // Entry name reaching FileInputStream through an intermediate File
    public void readEntryFile(ZipInputStream zipInputStream, File outDir) throws Exception {
        ZipEntry entry = zipInputStream.getNextEntry();
        // ruleid:archive-entry-path-traversal
        File destFile = new File(outDir, entry.getName());
        // ruleid:archive-entry-path-traversal
        FileInputStream in = new FileInputStream(destFile);
        in.close();
    }

    // ok:archive-entry-path-traversal
    public void extractZipSafe(ZipInputStream zipInputStream, File outDir) throws Exception {
        ZipEntry zipEntry;
        while ((zipEntry = zipInputStream.getNextEntry()) != null) {
            File destFile = new File(outDir, FilenameUtils.getName(zipEntry.getName()));
            FileOutputStream destOutputStream = new FileOutputStream(destFile);
            destOutputStream.close();
        }
    }

    // ok:archive-entry-path-traversal
    public void extractConstantName(ZipInputStream zipInputStream, File outDir) throws Exception {
        File destFile = new File(outDir, "fixed-name.txt");
        FileOutputStream destOutputStream = new FileOutputStream(destFile);
        destOutputStream.close();
    }

    // ok:archive-entry-path-traversal
    public void logEntryName(ZipInputStream zipInputStream) throws Exception {
        ZipEntry entry = zipInputStream.getNextEntry();
        System.out.println(entry.getName());
    }
}
