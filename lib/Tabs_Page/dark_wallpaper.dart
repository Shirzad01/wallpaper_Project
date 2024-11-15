import 'dart:math';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class ThreeD extends StatefulWidget {
  const ThreeD({super.key});

  @override
  State<ThreeD> createState() => _ThreeDState();
}

class _ThreeDState extends State<ThreeD> {
  List<String> imageUrls = [];
  TextEditingController textController = TextEditingController();
  final Connectivity _connectivity = Connectivity();
  bool isConnect = true;
  bool isLoading = true;

//لیست از رنگ ها
  final List<Color> colors = [
    Colors.white10,
    Colors.deepPurple,
    Colors.greenAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
  ];

  Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }

  Future<void> _loadImages() async {

    // شبیه‌سازی بارگذاری تصاویر از یک منبع آنلاین
    await Future.delayed(const Duration(seconds: 1));

    setState(() {

      isLoading = true;
    });
    List<String> newImages = [
      'https://i.pinimg.com/564x/3f/8e/22/3f8e229301b7eb206cbf988b8fef2a2d.jpg',
      'https://i.pinimg.com/564x/5f/8d/2b/5f8d2bbe8c8f2c1df4f360327c34721c.jpg',
      'https://i.pinimg.com/564x/b9/7e/c0/b97ec07d74ba5f2c37f0e569962a60ae.jpg',
      'https://i.pinimg.com/736x/4e/e3/e2/4ee3e27f5caaafbed699bc13f9d8de7b.jpg',
      'https://i.pinimg.com/736x/ea/73/0a/ea730a1d91cc36ddf39c753829cd6175.jpg',
      'https://i.pinimg.com/736x/43/e0/a8/43e0a8255d88595de7daa9e69bd82c5f.jpg',
      'https://i.pinimg.com/564x/77/cd/53/77cd535a4fae1c35929ca0ecd52e6725.jpg',
      'https://i.pinimg.com/564x/ea/90/69/ea906913ee18de65ed88ef5d7cc904b3.jpg',
      'https://i.pinimg.com/736x/31/9a/b3/319ab31ee38d650ca72b21c95f456928.jpg',
      'https://i.pinimg.com/736x/45/87/16/45871670a5c952f6df5a44cb883962d4.jpg',
      'https://i.pinimg.com/564x/09/77/69/097769d715ae8d95d65fca9fe7790513.jpg',
      'https://i.pinimg.com/564x/25/8a/81/258a810aa94474069f06ace1b3c070dd.jpg',
      'https://i.pinimg.com/564x/be/6d/ee/be6dee00242767987a056bca6d25214f.jpg',
      'https://i.pinimg.com/564x/11/b5/b3/11b5b3660c33b35900cf0f3724eb6478.jpg',
      'https://i.pinimg.com/564x/42/3b/e2/423be29cbed0df5be6ed265f3b69da06.jpg',
      'https://i.pinimg.com/736x/fa/0c/9d/fa0c9d691f93e732a705203d1c6f5748.jpg',
      'https://i.pinimg.com/564x/17/77/23/17772382078d53bba5c82daf7e87d427.jpg',
      'https://i.pinimg.com/736x/c3/d9/23/c3d9231a67e7dab1266043bd514c83cd.jpg',
      'https://i.pinimg.com/736x/14/c1/65/14c165c1dbf6254c2885ad78db8e5ef4.jpg',
      'https://i.pinimg.com/736x/8b/4c/91/8b4c914456c0293552fc7c0ecd05eaac.jpg',
      'https://i.pinimg.com/564x/f1/b2/26/f1b22638689925bbc6a6a8e76b8f9394.jpg',
      'https://i.pinimg.com/564x/06/a6/31/06a631a009358438513e0b596069ee6c.jpg',
      'https://i.pinimg.com/736x/fe/6c/2b/fe6c2bcf09ab4d420b180856658c49a3.jpg',
      'https://i.pinimg.com/564x/c1/ff/60/c1ff60aadbf9e63efc00c1ec8dd7fcac.jpg',
      'https://i.pinimg.com/736x/9a/47/4b/9a474bd8e777cff04db1d327072c4e36.jpg',
      'https://i.pinimg.com/564x/23/73/f7/2373f7da8c6fcba5b7d82bc25daa7fdd.jpg',
      'https://i.pinimg.com/736x/71/5c/c2/715cc2e7136f90c0c24c4b575e6ef6b7.jpg',
      'https://i.pinimg.com/564x/a4/c5/28/a4c5285643b99fee1842ca4c1e83f23e.jpg',
      'https://i.pinimg.com/564x/25/7d/27/257d277eea294cde5a570a6c5c0da90b.jpg',
      'https://i.pinimg.com/564x/ca/37/9a/ca379aca23b21feb708072838d03d5b2.jpg',
      'https://i.pinimg.com/564x/95/22/5b/95225b357fdfc3151a4c2b8865e0abaf.jpg',
      'https://i.pinimg.com/564x/91/b6/f0/91b6f064b0e79203d6291362a3ffdd9a.jpg',

    ];

    setState(() {
      imageUrls = newImages;
      isLoading = true;
    });
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    setState(() {
      isConnect = connectivityResult != ConnectivityResult.none;
    });
    if (isConnect) {
      await _loadImages();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImages();
    checkConnectivity();
  }

  Future<void> _refreshImages() async {
    setState(() {
      checkConnectivity();
      isLoading = true ;
      imageUrls = [];
    });
    await _loadImages(); // سپس تصاویر را مجدداً بارگذاری می‌کنیم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshImages,
        child: Scrollbar(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 11.0,
              mainAxisSpacing: 11.0,
              childAspectRatio: 0.8,
            ),
            itemCount: imageUrls.isEmpty ? 20 : imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  if (imageUrls.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetailPage(
                          imageUrls: imageUrls,
                          initialIndex: index,
                        ),
                      ),
                    );
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11.0),
                  child: Container(
                    color: imageUrls.isEmpty
                        ? getRandomColor()
                        : Colors.transparent,
                    child: imageUrls.isNotEmpty
                        ? Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/No connection.gif',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}