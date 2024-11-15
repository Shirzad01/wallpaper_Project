import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class Space extends StatefulWidget {
  const Space({super.key});

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> {
  List<String> imageUrls = [];
  TextEditingController textController = TextEditingController();
  final Connectivity _connectivity = Connectivity();
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
      "https://i.pinimg.com/564x/e4/7b/3b/e47b3b91f8aef7ddeff22720c2b1bd1a.jpg",
      "https://i.pinimg.com/564x/18/f5/6b/18f56b5865b562ecbc4e4a55ad37ac1e.jpg",
      "https://i.pinimg.com/736x/79/dd/db/79dddb4e7a36c04988cf0d24308d9687.jpg",
      "https://i.pinimg.com/564x/37/4b/e8/374be8d321af2a06af4a870878097722.jpg",
      "https://i.pinimg.com/564x/85/b7/b4/85b7b4f9203f4714b77dcac0958b5894.jpg",
      "https://i.pinimg.com/564x/84/27/60/8427607a0c91dd55ed729c0a5a24844d.jpg",
      "https://i.pinimg.com/736x/22/b8/07/22b807892a7e4f328629156cf8bb15d5.jpg",
      "https://i.pinimg.com/564x/32/d0/f3/32d0f3ca610f36a6d509347fdcf4e102.jpg",
      "https://i.pinimg.com/736x/8d/f2/34/8df234056a744e7393ff5c522c8d78c6.jpg",
      "https://i.pinimg.com/564x/b8/62/09/b86209ecb652da39b730ac7744af8e70.jpg",
      "https://i.pinimg.com/564x/3d/4e/24/3d4e2466ce4cfd5223d5c1a0bdfcb492.jpg",
      "https://i.pinimg.com/564x/85/05/7c/85057c255bbb76efcef47e55093e663a.jpg",
      "https://i.pinimg.com/564x/1b/6f/24/1b6f24fd215b0de7d07931a6661bbfed.jpg",
      "https://i.pinimg.com/564x/48/22/54/482254704099b4660982ed5816941a23.jpg",
      "https://i.pinimg.com/736x/70/9e/01/709e014a64b1bffa9a3cc2966958c09e.jpg",
      "https://i.pinimg.com/564x/6f/77/a4/6f77a44fe1c8780c6a38b0bf9d21ce4f.jpg",
      "https://i.pinimg.com/736x/99/29/fb/9929fb6ec37634a2fe76638845222d4a.jpg",
      "https://i.pinimg.com/originals/fe/7a/5c/fe7a5c3306c5902bb4abee6f5c70500d.jpg",
      "https://i.pinimg.com/564x/15/9f/e7/159fe7f91e5a3ba41882bdb8b4c02c3c.jpg",
      "https://i.pinimg.com/1200x/5f/ff/6d/5fff6d4334aa3074fac13a66014f26b4.jpg",
      "https://i.pinimg.com/564x/5f/37/5a/5f375a6708f1f3da308817381dcc072d.jpg",
      "https://i.pinimg.com/564x/ca/4c/56/ca4c56471cabac1714eabe5bc7fce155.jpg",
      "https://i.pinimg.com/564x/2d/64/77/2d64775a6ae59a8f0d3061e42e431a89.jpg",
      "https://i.pinimg.com/736x/67/2d/47/672d4736fa26c97c322064b864a367f6.jpg",
      "https://i.pinimg.com/1200x/22/bd/57/22bd57dfae333511f66f6e408cff68a6.jpg",
      "https://i.pinimg.com/736x/67/ec/be/67ecbea96f90fe29d4d5a03c33f3d135.jpg",
      "https://i.pinimg.com/564x/9a/92/e9/9a92e928f93afdedac5605cae684be08.jpg",
      "https://i.pinimg.com/736x/b9/e7/8c/b9e78c299cec8ed0a49cfcf61cf7becc.jpg",
      "https://i.pinimg.com/736x/e8/0f/b3/e80fb3e13960dd9aa45e377559c4d64c.jpg",
      "https://i.pinimg.com/736x/29/29/7d/29297d30a8f590779192356590d96a89.jpg",
      "https://i.pinimg.com/736x/32/3d/5b/323d5bd01f73e3b2187d3aebef05a13c.jpg",
      "https://i.pinimg.com/736x/25/a1/f4/25a1f4e80fa20bf348d2f75b24fd8c77.jpg",
      "https://i.pinimg.com/564x/85/05/7c/85057c255bbb76efcef47e55093e663a.jpg",
      "https://i.pinimg.com/564x/63/00/33/630033ca9f764c0b88914fab10bd30cc.jpg",
      "https://i.pinimg.com/564x/72/80/97/7280976ad70588d4c7050650484e7e2c.jpg",
      "https://i.pinimg.com/564x/d9/c6/8a/d9c68ac5fd013c9ef00562a458f354ee.jpg",
      "https://i.pinimg.com/564x/2a/29/9c/2a299c095f32d8c07aa51192ebf05911.jpg",
      "https://i.pinimg.com/736x/5a/7e/83/5a7e83b60747809ad5b4d267e9da5ac8.jpg",
      "https://i.pinimg.com/736x/58/42/bc/5842bc9d5a2e1d40cc33ab372f5692c5.jpg",
      "https://i.pinimg.com/564x/9e/65/a5/9e65a51732edf91885614e8ccaa9674e.jpg",
      "https://i.pinimg.com/564x/16/1a/e4/161ae4f9ca1e336663e3c8cb8cb00e1e.jpg",
      "https://i.pinimg.com/564x/0c/9d/36/0c9d360e1093e1861c77e1b5c90f4848.jpg",
      "https://i.pinimg.com/564x/df/2d/59/df2d59fd531460d1a1f03fe0eeb5c576.jpg",
      "https://i.pinimg.com/564x/a2/18/9c/a2189c70ed300554796445bbb88e8bb1.jpg",
      "https://i.pinimg.com/564x/67/68/35/676835ed5ba9f78a59e0c3b1c9c0b1e6.jpg",
      "https://i.pinimg.com/736x/f8/a7/85/f8a78546d8ccb14e8251faf917d4094b.jpg",
      "https://i.pinimg.com/564x/d6/52/b6/d652b641b40cc602cfdcca17a2e10205.jpg",
      "https://i.pinimg.com/736x/24/4c/ef/244cef8b731f821636d18c6d300b62af.jpg",
      "https://i.pinimg.com/736x/c9/a1/12/c9a112539d797fc388c79dc00b0f77b1.jpg",
      "https://i.pinimg.com/736x/01/4b/25/014b25fa63d5af19628b1a0423573b10.jpg",
      "https://i.pinimg.com/736x/9b/d0/28/9bd028aa035f45a265e98fa50185ab39.jpg",
      "https://i.pinimg.com/564x/01/75/f9/0175f9ac75560d3557036613016947bb.jpg",
      "https://i.pinimg.com/564x/ec/1c/78/ec1c78e5e606485923aabe0dd5f3ecef.jpg",
      "https://i.pinimg.com/736x/7d/cb/1f/7dcb1f475f4112cf0ad9d5dac012c11f.jpg",
      "https://i.pinimg.com/736x/dc/a7/36/dca7361f9ea40d68bbc4b94e94424245.jpg",
      "https://i.pinimg.com/736x/2e/75/9c/2e759c62bd75815f9cdbe756f66cd71e.jpg",
      "https://i.pinimg.com/736x/a8/ef/e0/a8efe0679f2f526dabf60e96f76ea32b.jpg",
      "https://i.pinimg.com/564x/c6/56/21/c656211866d004770227420ed8612cc0.jpg",
      "https://i.pinimg.com/736x/35/32/ce/3532ce7aeed3935cd868b07997bd35d8.jpg",
      "https://i.pinimg.com/564x/68/17/c6/6817c6e92e48a7ef193cc259597fcec4.jpg",
      "https://i.pinimg.com/564x/0f/07/98/0f0798a046676eeeb0ea66a423dbccb6.jpg",
      "https://i.pinimg.com/564x/97/a4/a1/97a4a10f21e238d65e2339cc49959d38.jpg",
      "https://i.pinimg.com/736x/0b/42/31/0b4231107c1b95f034f95e06b07e986d.jpg",
      "https://i.pinimg.com/564x/a5/3c/f0/a53cf04c528c22ebc83afb2643c3c023.jpg",
      "https://i.pinimg.com/564x/6b/73/79/6b7379d8697135348148d096a2806cf7.jpg",
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
          child: GridView.builder(
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
