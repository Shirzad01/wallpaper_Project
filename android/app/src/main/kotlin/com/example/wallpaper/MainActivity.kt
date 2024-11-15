package com.example.wallpaper

import android.app.WallpaperManager
import android.graphics.BitmapFactory
import android.os.Build
import android.os.Bundle
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayInputStream

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.gallery/wallpaper"

    @RequiresApi(Build.VERSION_CODES.N)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "setWallpaper") {
                val imageData = call.argument<ByteArray>("imageData")
                val screen = call.argument<String>("screen") // صفحه مورد نظر

                if (imageData != null && screen != null) {
                    setWallpaper(imageData, screen)
                    result.success(null)
                } else {
                    result.error("ERROR", "Image data or screen type is null", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.N)
    private fun setWallpaper(imageData: ByteArray, screen: String) {
        try {
            val wallpaperManager = WallpaperManager.getInstance(applicationContext)
            val bitmap = BitmapFactory.decodeStream(ByteArrayInputStream(imageData))

            when (screen) {
                "home" -> wallpaperManager.setBitmap(bitmap, null, true, WallpaperManager.FLAG_SYSTEM) // هوم اسکرین
                "lock" -> wallpaperManager.setBitmap(bitmap, null, true, WallpaperManager.FLAG_LOCK)   // لاک اسکرین
                else -> wallpaperManager.setBitmap(bitmap) // هر دو صفحه به عنوان پیش‌فرض
            }

            println("Wallpaper set successfully for $screen screen")
        } catch (e: Exception) {
            println("Error setting wallpaper: ${e.message}")
        }
    }
}
