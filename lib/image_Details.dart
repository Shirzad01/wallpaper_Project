import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailPage extends StatefulWidget {
  final List<String> imageUrls; // لیست تصاویر
  final int initialIndex; // شاخص تصویر اولیه
  static const platformRefresh = MethodChannel('com.example.gallery/refresh');
  static const platformWallpaper = MethodChannel('com.example.gallery/wallpaper');

  const ImageDetailPage({
    super.key,
    required this.imageUrls,
    this.initialIndex = 0,
  });

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  double _dragPosition = 0.0; // موقعیت عمودی کشیدن
  late AnimationController _controller; // کنترلر انیمیشن

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex); // تنظیم تصویر اولیه
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }
  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.primaryDelta!; // به روزرسانی موقعیت کشیدن
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_dragPosition > 150) { // آستانه برای خروج از صفحه
      _controller.reverse(from: 1.0).whenComplete(() {
        Navigator.of(context).pop();
      });
    } else {
      setState(() {
        _dragPosition = 0.0; // بازگشت به حالت اولیه
      });
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Future<void> _downloadImage(context, String imageUrl) async {
    try {
      var status = await Permission.mediaLibrary.request();
      if (status.isGranted) {
        Dio dio = Dio();
        Directory? directory = await getExternalStorageDirectory();
        String newPath = '${directory?.path}/${imageUrl.split('/').last}';

        var response = await dio.download(imageUrl, newPath);
        if (response.statusCode == 200) {
          final result = await ImageGallerySaver.saveFile(newPath);
          print("Save Result: $result");

          if (result != null && result['isSuccess'] == true) {
            try {
              await ImageDetailPage.platformRefresh.invokeMethod('refreshGallery', {'path': newPath});
              print("Gallery refreshed successfully");
            } catch (e) {
              print("Error refreshing gallery: $e");
            }

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image saved to gallery successfully')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to save image to gallery')),
            );
          }
        }
      } else if (status.isPermanentlyDenied) {
        bool isOpened = await openAppSettings();
        if (!isOpened) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Permission permanently denied. Please enable it from settings.')),
          );
        }
      } else {
        ScaffoldMessenger.of(
            context).showSnackBar(
          const SnackBar(content: Text('Permission denied')),
        );
      }
    } catch (e) {
      print('Download error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download image')),
      );
    }
  }

  Future<void> _setWallpaperFromUrl(String screen, String imageUrl) async {
    try {
      final response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      final Uint8List imageData = response.data;

      await ImageDetailPage.platformWallpaper.invokeMethod(
        'setWallpaper',
        {
          'imageData': imageData,
          'screen': screen, // صفحه مورد نظر
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image set as wallpaper on $screen screen')),
      );
    } catch (e) {
      print("Error setting wallpaper: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to set wallpaper')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            color: Colors.black,
            onSelected: (value) {
              int currentIndex = _pageController.page?.round() ?? 0;
              String currentImageUrl = widget.imageUrls[currentIndex];

              if (value == 'download') {
                _downloadImage(context, currentImageUrl);
              } else if (value == 'home') {
                _setWallpaperFromUrl("home", currentImageUrl);
              } else if (value == 'lock') {
                _setWallpaperFromUrl("lock", currentImageUrl);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'download',
                child: ListTile(
                  title: Text("Download", style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  leading: const Icon(Icons.download_outlined, color: Colors.white),
                ),
              ),
              PopupMenuItem(
                value: 'home',
                child: ListTile(
                  title: Text("Set as Home Screen", style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  leading: const Icon(Icons.home_outlined, color: Colors.white),
                ),
              ),
              PopupMenuItem(
                value: 'lock',
                child: ListTile(
                  title: Text("Set as Lock Screen", style: TextStyle(color: Colors.white.withOpacity(0.8))),
                  leading: const Icon(Icons.lock_open_outlined, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1 - (_dragPosition / 400).clamp(0, 1),
          child: Transform.translate(
            offset: Offset(0, _dragPosition),
            child: Transform.scale(
              scale: 1 - (_dragPosition / 1000).clamp(0, 0.3),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: PhotoView(
                      imageProvider: NetworkImage(widget.imageUrls[index]),
                      heroAttributes: PhotoViewHeroAttributes(tag: widget.imageUrls[index]),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 4,
                      initialScale: PhotoViewComputedScale.contained,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
