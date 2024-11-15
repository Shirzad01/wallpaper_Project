import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class musicPage extends StatefulWidget {
  const musicPage({super.key});

  @override
  State<musicPage> createState() => _musicPageState();
}

class _musicPageState extends State<musicPage> {
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
      "https://i.pinimg.com/736x/c9/95/3c/c9953c2d6b8c1c5fd3584d800cf4cc9d.jpg",
      "https://i.pinimg.com/736x/73/b5/3d/73b53d486885945d005c97767d33c275.jpg",
      "https://i.pinimg.com/1200x/b9/84/0c/b9840c909372df8fcbf0b8c51c710967.jpg",
      "https://i.pinimg.com/736x/fe/20/69/fe20694bc6647901f26c8ef6e6ac588a.jpg",
      "https://i.pinimg.com/736x/db/a9/24/dba924bfd507b8d2d8942f8d75a8cfcf.jpg",
      "https://i.pinimg.com/736x/a2/4c/43/a24c43a46c56f153c1cf8c26637fa1a3.jpg",
      "https://i.pinimg.com/736x/41/1f/5a/411f5a02f9713cdf91ece9bfc77c0ce4.jpg",
      "https://i.pinimg.com/736x/d2/f0/3d/d2f03d6d1fd6407415cf879521559986.jpg",
      "https://i.pinimg.com/736x/7e/7d/e4/7e7de46c9810817fd5c1cc62476c0151.jpg",
      "https://i.pinimg.com/736x/af/45/00/af450050117cccd02a2c93c9c6720764.jpg",
      "https://i.pinimg.com/736x/6c/92/05/6c9205182d006b160d41b2646472013c.jpg",
      "https://i.pinimg.com/736x/f4/ba/b0/f4bab0da55f89860853425ea6647e1a2.jpg",
      "https://i.pinimg.com/736x/cf/af/da/cfafda55fa93a1235c01f4a6dcbc0449.jpg",
      "https://i.pinimg.com/736x/ba/f4/b2/baf4b29957608204c5d6a3a7bed1817d.jpg",
      "https://i.pinimg.com/736x/de/7c/40/de7c40d72990892c7aae3335167ff123.jpg",
      "https://i.pinimg.com/736x/3f/c5/80/3fc580ff292580325fc1b14a30e8ba80.jpg",
      "https://i.pinimg.com/736x/f3/80/5d/f3805da25fb5746380387df46ade54ee.jpg",
      "https://i.pinimg.com/736x/48/0e/a0/480ea05228d0a873d13ce10fdefef4d9.jpg",
      "https://i.pinimg.com/736x/d4/85/67/d4856755d0c50abbe5146af0c045c74f.jpg",
      "https://i.pinimg.com/736x/57/06/bc/5706bcead0d49dd09135230c35f28722.jpg",
      "https://i.pinimg.com/736x/fb/61/a8/fb61a86073b969162d390b2a3b24a438.jpg",
      "https://i.pinimg.com/736x/77/6b/44/776b442a7e77327cbaeaf22452337688.jpg",
      "https://i.pinimg.com/736x/eb/37/73/eb37732e9bb4ddaafd06c03f47f6308a.jpg",
      "https://i.pinimg.com/736x/bd/e6/80/bde680900e19838fb2faf19ebeb30cbc.jpg",
      "https://i.pinimg.com/736x/5a/6b/5a/5a6b5a2f8a1493a4292ad1e253755644.jpg",
      "https://i.pinimg.com/736x/24/1d/27/241d27de9aef25da07d249d980c8bc86.jpg",
      "https://i.pinimg.com/736x/72/33/8f/72338fbfd68e938db992cfebf3dfa1f0.jpg",
      "https://i.pinimg.com/736x/08/c8/39/08c839c198e75dbae58314d4ad832573.jpg",
      "https://i.pinimg.com/736x/d7/75/9c/d7759c8152eaa18f4446da6c38af2d00.jpg",
      "https://i.pinimg.com/736x/3d/f0/0f/3df00f73c3fb7df0305ec950261eddeb.jpg",
      "https://i.pinimg.com/736x/ed/da/bf/eddabf1355cd6aa1da7eb89c84f24f17.jpg",
      "https://i.pinimg.com/736x/24/f1/e5/24f1e55aeb4f262d04beb5ae07ccf160.jpg",

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
