package ${packageName}.data.repository.local;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * Helper class to do operations on regular files/directories.
 */
@Singleton
public class FileManager {

    private static final String TAG = "FileManager";

    @Inject
    public FileManager() {
    }

    /**
     * Closes a writer without launching exception
     *
     * @param writer the writer
     */
    private void closeQuietly(Writer writer) {
        if (writer != null) {
            try {
                writer.close();
            } catch (IOException exception) {
                Log.e(TAG, "Error closing writer", exception);
            }
        }
    }

    /**
     * Closes a reader without launching exception
     *
     * @param reader the reader
     */
    private void closeQuietly(Reader reader) {
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException exception) {
                Log.e(TAG, "Error closing reader", exception);
            }
        }
    }

    /**
     * Writes a file to Disk.
     * This is an I/O operation and this method executes in the main thread, so it is recommended to
     * perform this operation using another thread.
     *
     * @param file The file to write to Disk.
     */
    public void writeToFile(File file, String fileContent) {
        if (!file.exists()) {
            FileWriter writer = null;
            try {
                writer = new FileWriter(file);
                writer.write(fileContent);
            } catch (IOException exception) {
                Log.e(TAG, "Error writing to disk", exception);
            } finally {
                closeQuietly(writer);
            }
        }
    }

    /**
     * Reads a content from a file.
     * This is an I/O operation and this method executes in the main thread, so it is recommended to
     * perform the operation using another thread.
     *
     * @param file The file to read from.
     * @return A string with the content of the file.
     */
    public String readFileContent(File file) {
        StringBuilder fileContentBuilder = new StringBuilder();
        if (file.exists()) {
            String stringLine;
            FileReader fileReader = null;
            BufferedReader bufferedReader = null;
            try {
                fileReader = new FileReader(file);
                bufferedReader = new BufferedReader(fileReader);
                while ((stringLine = bufferedReader.readLine()) != null) {
                    fileContentBuilder.append(stringLine).append('\n');
                }
            } catch (IOException exception) {
                Log.e(TAG, "Error reading file", exception);
            } finally {
                closeQuietly(bufferedReader);
                closeQuietly(fileReader);
            }
        }

        return fileContentBuilder.toString();
    }

    /**
     * Returns a boolean indicating whether this file can be found on the underlying file system.
     *
     * @param file The file to check existence.
     * @return true if this file exists, false otherwise.
     */
    public boolean exists(File file) {
        return file.exists();
    }

    /**
     * Warning: Deletes the content of a directory.
     * This is an I/O operation and this method executes in the main thread, so it is recommended to
     * perform the operation using another thread.
     *
     * @param directory The directory which its content will be deleted.
     */
    public boolean clearDirectory(File directory) {
        boolean result = false;
        if (directory.exists()) {
            for (File file : directory.listFiles()) {
                result = file.delete();
            }
        }
        return result;
    }

    /**
     * Write a value to a user preferences file.
     *
     * @param context            {@link android.content.Context} to retrieve android user preferences.
     * @param preferenceFileName A file name representing where data will be written to.
     * @param key                A string for the key that will be used to retrieve the value in the future.
     * @param value              A long representing the value to be inserted.
     */
    public void writeToPreferences(Context context, String preferenceFileName, String key, long value) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(preferenceFileName, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putLong(key, value);
        editor.apply();
    }

    /**
     * Get a value from a user preferences file.
     *
     * @param context            {@link android.content.Context} to retrieve android user preferences.
     * @param preferenceFileName A file name representing where data will be get from.
     * @param key                A key that will be used to retrieve the value from the preference file.
     * @return A long representing the value retrieved from the preferences file.
     */
    public long getFromPreferences(Context context, String preferenceFileName, String key) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(preferenceFileName, Context.MODE_PRIVATE);
        return sharedPreferences.getLong(key, 0);
    }
}
