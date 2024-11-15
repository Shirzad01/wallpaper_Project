import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class neymarPage extends StatefulWidget {
  const neymarPage({super.key});

  @override
  State<neymarPage> createState() => _neymarPageState();
}

class _neymarPageState extends State<neymarPage> {
  List<String> imageUrls = [];
  TextEditingController textController = TextEditingController();
  final Connectivity _connectivity = Connectivity();
  final ScrollController _scrollController = ScrollController();

  bool isConnect = true;
  bool isLoading = true;

//لیست از رنگ ها
  final List<Color> colors = [
    const Color(0xFF2F4F4F), // Dark Slate Gray
    const Color(0xFF191970), // Midnight Blue
    const Color(0xFF556B2F), // Dark Olive Green
    const Color(0xFF006400), // Dark Green
    const Color(0xFF483D8B), // Dark Slate Blue
    const Color(0xFF8B4513), // Saddle Brown
    const Color(0xFF8B0000), // Dark Red
    const Color(0xFFFF8C00), // Dark Orange
    const Color(0xFFD2691E), // Chocolate
    const Color(0xFFB22222), // Firebrick
    const Color(0xFF4B0082), // Indigo
    const Color(0xFF00008B), // Dark Blue
    const Color(0xFF000080), // Navy
    const Color(0xFF008B8B), // Dark Cyan
    const Color(0xFF9400D3), // Dark Violet
    const Color(0xFF9932CC), // Dark Orchid
    const Color(0xFF696969), // Dim Gray
    const Color(0xFF708090), // Slate Gray
    const Color(0xFF36454F), // Charcoal
    const Color(0xFF555D50), // Ebony
    const Color(0xFF2A3439), // Gunmetal
    const Color(0xFF343434), // Jet
    const Color(0xFF353839), // Onyx
    const Color(0xFF414A4C), // Outer Space
    const Color(0xFF333333), // Dark Charcoal
    const Color(0xFF1E272C), // Black Pearl
    const Color(0xFF1B1B1B), // Eerie Black
    const Color(0xFF242124), // Raisin Black
    const Color(0xFF1A1110), // Licorice
    const Color(0xFF000001), // Vantablack
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
      "https://i.pinimg.com/736x/e8/7f/f4/e87ff4525c6780da0177891fca570652.jpg",
      "https://i.pinimg.com/736x/a9/6d/96/a96d96b29481e1005b6e9344a27533a2.jpg",
      "https://i.pinimg.com/736x/f8/ca/89/f8ca8949b4cfdbccc40d971792507dd5.jpg",
      "https://i.pinimg.com/736x/db/f6/e0/dbf6e0d9b79fae5a490f207ff862ee84.jpg",
      "https://i.pinimg.com/736x/dc/61/0c/dc610c5cbc677b1dd503422437ffb09d.jpg",
      "https://i.pinimg.com/736x/00/b4/0a/00b40ab8dc0a0c9764078421b036666f.jpg",
      "https://i.pinimg.com/736x/31/01/a3/3101a3d0c2b3378c1a8ba88ff459ba7a.jpg",
      "https://i.pinimg.com/736x/e3/93/b7/e393b7bec30931688b92711f9de1b84b.jpg",
      "https://i.pinimg.com/736x/ab/1d/d9/ab1dd99487f0165ff518c16ff552f5b5.jpg",
      "https://i.pinimg.com/736x/4f/43/74/4f43746a2dd637efef9e6564b43de867.jpg",
      "https://i.pinimg.com/736x/71/b6/aa/71b6aa51334d0a7d59d82f3570dda1cf.jpg",
      "https://i.pinimg.com/736x/b2/d1/dd/b2d1ddbba9b61ecf266d1bcb605b29e7.jpg",
      "https://i.pinimg.com/736x/0a/c5/a2/0ac5a2b5f76d993fa8153e56e20695d0.jpg",
      "https://i.pinimg.com/736x/77/5a/aa/775aaa437fb300c3bdeb59a5e04fbd11.jpg",
      "https://i.pinimg.com/736x/4d/ca/27/4dca27efad54d76dcdf9305da4e3577f.jpg",
      "https://i.pinimg.com/736x/7d/c9/bc/7dc9bc978e86d88846adc8e01948416b.jpg",
      "https://i.pinimg.com/736x/a2/b6/6a/a2b66a5b313c7dce72e840b6b35bb8d1.jpg",
      "https://i.pinimg.com/736x/b3/08/6d/b3086d6401db1fe1f497198cb405be69.jpg",
      "https://i.pinimg.com/736x/6f/dc/c1/6fdcc1b7fe3000c1019bf0063c96e435.jpg",
      "https://i.pinimg.com/736x/d5/7d/50/d57d503e24b2f94476350d2b561e9b4f.jpg",
      "https://i.pinimg.com/736x/cc/c7/3c/ccc73c305c379c4f15128cc723a7c0d0.jpg",
      "https://i.pinimg.com/736x/70/a6/4a/70a64ac082d216f719bc44ad4f0bda83.jpg",
      "https://i.pinimg.com/736x/b7/be/f5/b7bef57ef3d9e03710fe85f54c91ed43.jpg",
      "https://i.pinimg.com/736x/62/85/29/6285297cf841fdd2feba158394db8ac2.jpg",
      "https://i.pinimg.com/736x/35/d0/fa/35d0fa612c55e5548e8288ccbf320504.jpg",
      "https://i.pinimg.com/736x/6f/b0/f5/6fb0f590c909a3a0622081608bd45b7b.jpg",
      "https://i.pinimg.com/736x/94/a0/c0/94a0c01431ec541940f953405e114c9a.jpg",
      "https://i.pinimg.com/736x/2d/b4/f1/2db4f110b1e96a426c156304608d4ecd.jpg",
      "https://i.pinimg.com/736x/56/7e/d2/567ed204a2f74f21a19d32d5170fcf3d.jpg",
      "https://i.pinimg.com/736x/3d/27/94/3d279474451ba3be44fdb34f928b49a9.jpg",
      "https://i.pinimg.com/736x/7e/dc/d0/7edcd0f9b2525f951290bbc7d0d18f1f.jpg",
      "https://i.pinimg.com/736x/1b/a4/79/1ba479511a0c1d7afd3679c7add3c93c.jpg",
      "https://i.pinimg.com/736x/1a/01/ed/1a01eda1ce0822f1a6ada6a579ba2eaa.jpg",
      "https://i.pinimg.com/736x/37/9c/ff/379cfff581bd7511d6973e71c2480ab3.jpg",
      "https://i.pinimg.com/736x/ec/1d/6e/ec1d6ed0a980dac255688425b6388524.jpg",
      "https://i.pinimg.com/736x/06/2f/e3/062fe3b514fd9deff0777a875631fc35.jpg",
      "https://i.pinimg.com/736x/04/92/e6/0492e6523b43c9b3a28358cd93baf036.jpg",
      "https://i.pinimg.com/736x/c6/9e/67/c69e67873eb811584386e5c7f1a87ad6.jpg",
      "https://i.pinimg.com/736x/a7/eb/20/a7eb2036f28a058b269110bca5245f38.jpg",
      "https://i.pinimg.com/736x/28/57/9e/28579ed3469f1c0002d4b4ed099bc33e.jpg",
      "https://i.pinimg.com/736x/4e/12/18/4e1218a57e7717fca84097bcd2b0e846.jpg",
      "https://i.pinimg.com/736x/0f/e6/52/0fe652c6c439ba81c827c8dcfef5b314.jpg",
      "https://i.pinimg.com/736x/f1/30/e6/f130e6850b5d22c57bd8d7f26f59751f.jpg",
      "https://i.pinimg.com/736x/e3/64/90/e36490204e9134dc0cd14e3505174f2e.jpg",

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
      isLoading = true;
      imageUrls = [];
    });
    await _loadImages(); // سپس تصاویر را مجدداً بارگذاری می‌کنیم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.black45,
        onRefresh: _refreshImages,
        child: Scrollbar(
          controller: _scrollController,
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800
                  ? 4
                  : 2, // برای نمایشگرهای بزرگتر در وب 4 ستون و در اندروید 2 ستون
              crossAxisSpacing: 11.0,
              mainAxisSpacing: 11.0,
              childAspectRatio:
                  MediaQuery.of(context).size.width > 800 ? 0.7 : 0.8,
            ),
            itemCount: imageUrls.isEmpty ? 20 : imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
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
                  child: Stack(
                    children: [
                      Container(
                        color: getRandomColor(),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      // تصویر که بعد از لود شدن کانتینر سفید را می‌پوشاند
                      imageUrls.isNotEmpty
                          ? Hero(
                              tag: imageUrls[index],
                              child: CachedNetworkImage(
                                imageUrl: imageUrls[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: (context, url) => Container(
                                  color: getRandomColor(),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Image.asset(
                                  'assets/No connection.gif',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                      )
                          : Container(),
                    ],
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
