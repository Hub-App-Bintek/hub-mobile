package id.go.pkp.hub

import android.content.ContentValues
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "id.go.pkp.hub/files"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "saveToPublicDocuments" -> {
                    val projectName = (call.argument<String>("projectName") ?: "Untitled").sanitizeSegment()
                    val fileName = (call.argument<String>("fileName") ?: "file.dat").sanitizeSegment(allowDot = true)
                    val bytes: ByteArray? = call.argument("bytes")
                    val mimeType = call.argument<String>("mimeType") ?: "application/octet-stream"

                    if (bytes == null) {
                        result.error("INVALID", "bytes is null", null)
                        return@setMethodCallHandler
                    }

                    // Perform heavy I/O work off the main thread to avoid UI jank
                    Thread {
                        try {
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                                val relative = Environment.DIRECTORY_DOCUMENTS + "/PKP/" + projectName
                                val resolver = applicationContext.contentResolver
                                val contentValues = ContentValues().apply {
                                    put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                                    put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
                                    put(MediaStore.MediaColumns.RELATIVE_PATH, relative)
                                    // Mark as pending during write to improve consistency
                                    put(MediaStore.MediaColumns.IS_PENDING, 1)
                                }

                                val collection: Uri = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                                    MediaStore.Files.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)
                                } else {
                                    MediaStore.Files.getContentUri("external")
                                }

                                val uri = resolver.insert(collection, contentValues)
                                if (uri == null) {
                                    runOnUiThread { result.error("INSERT_FAILED", "Failed to create file in MediaStore", null) }
                                    return@Thread
                                }

                                try {
                                    resolver.openOutputStream(uri)?.use { os ->
                                        os.write(bytes)
                                        os.flush()
                                    }
                                } finally {
                                    // Mark as not pending so it's visible to user
                                    val cv = ContentValues().apply {
                                        put(MediaStore.MediaColumns.IS_PENDING, 0)
                                    }
                                    resolver.update(uri, cv, null, null)
                                }

                                runOnUiThread { result.success(uri.toString()) }
                            } else {
                                // Legacy external public directory path: /storage/emulated/0/Documents/PKP/{projectName}
                                val base = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)
                                val targetDir = File(base, "PKP/" + projectName)
                                if (!targetDir.exists()) targetDir.mkdirs()
                                val outFile = File(targetDir, fileName)
                                FileOutputStream(outFile).use { fos ->
                                    fos.write(bytes)
                                    fos.flush()
                                }
                                runOnUiThread { result.success(outFile.absolutePath) }
                            }
                        } catch (e: Exception) {
                            runOnUiThread { result.error("ERROR", e.message, null) }
                        }
                    }.start()
                }
                else -> result.notImplemented()
            }
        }
    }
}

private fun String.sanitizeSegment(allowDot: Boolean = false): String {
    val pattern = if (allowDot) "[^a-zA-Z0-9._ -]" else "[^a-zA-Z0-9_ -]"
    val cleaned = this.replace(Regex(pattern), "").trim()
    return if (cleaned.isEmpty()) "Untitled" else cleaned
}
