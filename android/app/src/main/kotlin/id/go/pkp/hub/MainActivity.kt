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
                    try {
                        val projectName = (call.argument<String>("projectName") ?: "Untitled").sanitizeSegment()
                        val fileName = (call.argument<String>("fileName") ?: "file.dat").sanitizeSegment(allowDot = true)
                        val bytes: ByteArray? = call.argument("bytes")
                        val mimeType = call.argument<String>("mimeType") ?: "application/octet-stream"
                        if (bytes == null) {
                            result.error("INVALID", "bytes is null", null)
                            return@setMethodCallHandler
                        }
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                            // Documents/PKP/{projectName}
                            val relative = Environment.DIRECTORY_DOCUMENTS + "/PKP/" + projectName
                            val resolver = applicationContext.contentResolver
                            val contentValues = ContentValues().apply {
                                put(MediaStore.MediaColumns.DISPLAY_NAME, fileName)
                                put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
                                put(MediaStore.MediaColumns.RELATIVE_PATH, relative)
                            }
                            val collection: Uri = MediaStore.Files.getContentUri("external")
                            val uri = resolver.insert(collection, contentValues)
                            if (uri == null) {
                                result.error("INSERT_FAILED", "Failed to create file in MediaStore", null)
                                return@setMethodCallHandler
                            }
                            resolver.openOutputStream(uri)?.use { os ->
                                os.write(bytes)
                                os.flush()
                            }
                            result.success(uri.toString())
                        } else {
                            // Legacy path: /storage/emulated/0/Documents/PKP/{projectName}
                            val base = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)
                            val targetDir = File(base, "PKP/" + projectName)
                            if (!targetDir.exists()) targetDir.mkdirs()
                            val outFile = File(targetDir, fileName)
                            FileOutputStream(outFile).use { fos ->
                                fos.write(bytes)
                                fos.flush()
                            }
                            result.success(outFile.absolutePath)
                        }
                    } catch (e: Exception) {
                        result.error("ERROR", e.message, null)
                    }
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
