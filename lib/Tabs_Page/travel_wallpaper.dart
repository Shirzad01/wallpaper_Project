import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class travelPage extends StatefulWidget {
  const travelPage({super.key});

  @override
  State<travelPage> createState() => _travelPageState();
}

class _travelPageState extends State<travelPage> {
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
      "https://i.pinimg.com/736x/8d/df/f6/8ddff6622e88434030e814635cffdaba.jpg",
      "https://i.pinimg.com/736x/f5/bd/d5/f5bdd5ae9a60c5f445f35c121ce6fc64.jpg",
      "https://i.pinimg.com/736x/38/52/6b/38526b2fead472b245a3df2528bfe2ad.jpg",
      "https://i.pinimg.com/736x/b9/1b/16/b91b16b5227999b64cad376f2865e9e6.jpg",
      "https://i.pinimg.com/736x/02/65/bf/0265bfe78dabf16156d31fe7018d04ff.jpg",
      "https://i.pinimg.com/736x/d5/e0/73/d5e073f6cb28d8a1da885d555d2fd926.jpg",
      "https://i.pinimg.com/736x/c4/0e/4d/c40e4d6b4c0f410b40f55f7591eabe05.jpg",
      "https://i.pinimg.com/736x/1c/ee/c9/1ceec9fd13149ffdad97d0b8bb1888c2.jpg",
      "https://i.pinimg.com/736x/59/7e/87/597e87996a681b41147d038a0ad86566.jpg",
      "https://i.pinimg.com/736x/c1/d8/a5/c1d8a57d8c930ba226bfb57f60667554.jpg",
      "https://i.pinimg.com/736x/3c/df/73/3cdf73e7afcb8409f072c7bee56ad601.jpg",
      "https://i.pinimg.com/736x/50/d0/f7/50d0f758e62f4edfa86ba73c517e8415.jpg",
      "https://i.pinimg.com/736x/77/b1/e4/77b1e446ed910894190b03a7627297da.jpg",
      "https://i.pinimg.com/736x/77/f1/41/77f1417f5522f216c05abdfbcad3eb22.jpg",
      "https://i.pinimg.com/736x/00/72/e5/0072e51268a4cfe24e525da99bf593a6.jpg",
      "https://i.pinimg.com/736x/a1/c0/3a/a1c03a0086b5dea4ba9aef887ff8caea.jpg",
      "https://i.pinimg.com/736x/7b/aa/c1/7baac181c1f70f38ed0e89c1996723e8.jpg",
      "https://i.pinimg.com/736x/30/b2/a0/30b2a0a7ba5a9345e15056e7c50749d3.jpg",
      "https://i.pinimg.com/736x/cb/6e/7a/cb6e7a813697b1c57113bb46e38121a4.jpg",
      "https://i.pinimg.com/736x/54/5e/02/545e02533da264a5a5bc6f8aa102e975.jpg",
      "https://i.pinimg.com/736x/59/bf/07/59bf077e15807ebb6bf2ca0e7bccce37.jpg",
      "https://i.pinimg.com/736x/6e/74/8e/6e748efa0f98493937a89b095ed5a29d.jpg",
      "https://i.pinimg.com/736x/75/65/aa/7565aa04e734153e4dc640a3719cbf92.jpg",
      "https://i.pinimg.com/736x/fd/39/28/fd3928f6d7cdef9be57ec7e269913fc3.jpg",
      "https://i.pinimg.com/736x/82/a6/98/82a69805dff068b44a5b95089aecc0a2.jpg",
      "https://i.pinimg.com/736x/06/b5/b4/06b5b430c0770742578c33ea934fdebe.jpg",
      "https://i.pinimg.com/736x/7a/c2/19/7ac219e4097b554b32cf2545efa22ae3.jpg",
      "https://i.pinimg.com/736x/b0/f9/ce/b0f9cecd5ebcd39fc6c6dca8794dc379.jpg",
      "https://i.pinimg.com/736x/91/27/27/912727243121bb9e0b7ef671b5046cda.jpg",
      "https://i.pinimg.com/736x/ab/17/fc/ab17fc06a1c7f8e7ed5ebcb16adb7ae9.jpg",
      "https://i.pinimg.com/736x/ff/01/c7/ff01c70a613787d7c6ed2002870ba16d.jpg",
      "https://i.pinimg.com/736x/d7/99/b0/d799b00d462a91026fac6b7df7f3b22f.jpg",
      "https://i.pinimg.com/736x/8f/2f/c7/8f2fc77f3df800c0c6eb3dbf4ef2febe.jpg",
      "https://i.pinimg.com/736x/e3/bb/d4/e3bbd42d9c6a0ca47e6144ed0056257f.jpg",
      "https://i.pinimg.com/736x/3b/c4/f1/3bc4f1285e2c64018988b5cb33eaccdf.jpg",
      "https://i.pinimg.com/736x/4b/1b/a9/4b1ba9ee2d5f328f31b45b3bd14ecad8.jpg",
      "https://i.pinimg.com/736x/fa/7c/da/fa7cdae7a5b94ba23dd67f2c57a7b3ab.jpg",
      "https://i.pinimg.com/736x/d5/f2/f9/d5f2f9b6f588ffd620a83ee141b81d57.jpg",
      "https://i.pinimg.com/736x/3a/35/f4/3a35f47a25798c27b56dcb661efe9d6d.jpg",
      "https://i.pinimg.com/736x/6c/10/8d/6c108d2b5fcee4de0c73dc9716e502e5.jpg",
      "https://i.pinimg.com/736x/62/35/92/6235922325dd4e2efc6ef3498d1762de.jpg",
      "https://i.pinimg.com/736x/06/e0/2d/06e02dc8bdba10ea6bb31df13a103183.jpg",
      "https://i.pinimg.com/736x/59/08/c5/5908c536bf5b41e46edf7fec2a4d3ea7.jpg",
      "https://i.pinimg.com/736x/60/5c/ec/605cece908322c6ac6b57662cbc2ee25.jpg",
      "https://i.pinimg.com/736x/00/6a/7c/006a7c0be8e0a8d00f026b4d89534279.jpg",
      "https://i.pinimg.com/736x/b3/56/64/b35664b5447b14fb79885a7c3ef5e525.jpg",
      "https://i.pinimg.com/736x/bb/3c/5b/bb3c5bb2f352eb1ce57cc60085fc3340.jpg",
      "https://i.pinimg.com/736x/3f/d7/88/3fd788a2ce5764c92d1fbaea0d1ea623.jpg",
      "https://i.pinimg.com/736x/ce/9b/0a/ce9b0a3cf316b18000f58c51402eeec4.jpg",
      "https://i.pinimg.com/736x/d6/0f/c9/d60fc9e2841f8c17063c20e2c31d38f3.jpg",
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
                                errorWidget: (context, url, error) =>
                                    Image.asset(
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
