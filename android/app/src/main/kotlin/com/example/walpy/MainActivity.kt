package com.example.walpy

import android.app.WallpaperManager
import android.graphics.BitmapFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMethodCodec
import java.io.FileInputStream

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val taskQueue = flutterEngine.dartExecutor.binaryMessenger.makeBackgroundTaskQueue()
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            WALLPAPER_CHANNEL,
            StandardMethodCodec.INSTANCE,
            taskQueue,
        ).setMethodCallHandler { call, result ->
            if (call.method != "setWallpaper") {
                result.notImplemented()
                return@setMethodCallHandler
            }

            val filePath = call.argument<String>("filePath")
            val target = call.argument<String>("target")
            if (filePath == null || target == null) {
                result.error("INVALID_ARGUMENT", "A file path and target are required.", null)
                return@setMethodCallHandler
            }

            try {
                FileInputStream(filePath).use { input ->
                    val bitmap = BitmapFactory.decodeStream(input)
                        ?: throw IllegalArgumentException("The wallpaper image could not be decoded.")
                    try {
                        val wallpaperManager = WallpaperManager.getInstance(applicationContext)
                        when (target) {
                            "home" -> wallpaperManager.setBitmap(
                                bitmap,
                                null,
                                true,
                                WallpaperManager.FLAG_SYSTEM,
                            )
                            "lock" -> wallpaperManager.setBitmap(
                                bitmap,
                                null,
                                true,
                                WallpaperManager.FLAG_LOCK,
                            )
                            "both" -> {
                                wallpaperManager.setBitmap(
                                    bitmap,
                                    null,
                                    true,
                                    WallpaperManager.FLAG_SYSTEM,
                                )
                                wallpaperManager.setBitmap(
                                    bitmap,
                                    null,
                                    true,
                                    WallpaperManager.FLAG_LOCK,
                                )
                            }
                            else -> throw IllegalArgumentException("Unknown wallpaper target.")
                        }
                    } finally {
                        bitmap.recycle()
                    }
                }
                result.success(true)
            } catch (error: Exception) {
                result.error("SET_WALLPAPER_FAILED", error.message, null)
            }
        }
    }

    private companion object {
        const val WALLPAPER_CHANNEL = "com.example.walpy/wallpaper"
    }
}
