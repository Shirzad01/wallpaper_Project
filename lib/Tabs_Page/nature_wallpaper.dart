import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class nature extends StatefulWidget {
  const nature({super.key});

  @override
  State<nature> createState() => _natureState();
}

class _natureState extends State<nature> {
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
      "https://i.pinimg.com/564x/87/c7/89/87c789289d8bdec755e406595a122795.jpg",
      "https://i.pinimg.com/736x/01/de/5c/01de5c43e1e4ad350cebf3e5afec92bf.jpg",
      "https://i.pinimg.com/736x/5f/b5/04/5fb504f7ed4b139615ac658e6d3af304.jpg",
      "https://i.pinimg.com/736x/d8/16/06/d816065f2da59a8b5447b8fd470d114f.jpg",
      "https://i.pinimg.com/564x/7f/fb/26/7ffb2691ec46638e11a5337ffa1762f8.jpg",
      "https://i.pinimg.com/736x/de/f1/f3/def1f3321c7340363d5e60657d4aef59.jpg",
      "https://i.pinimg.com/564x/ca/b0/fd/cab0fd8741f39f251d5cd6736a884eb4.jpg",
      "https://i.pinimg.com/564x/58/67/db/5867dbe5dde20a33702057b0147e8608.jpg",
      "https://i.pinimg.com/736x/c2/19/53/c21953f3ad4a17d96eb80d649bc8149b.jpg",
      "https://i.pinimg.com/736x/51/66/1e/51661e39d7e076af07e7c95361587f64.jpg",
      "https://i.pinimg.com/736x/5e/a7/7e/5ea77e6a8f023e91c79c2268bb2be9f0.jpg",
      "https://i.pinimg.com/736x/5c/d8/ca/5cd8ca04e9b775d36cc3d15055ba1b54.jpg",
      "https://i.pinimg.com/564x/47/30/6a/47306a9e61143b4fe54bd954c98ed1c7.jpg",
      "https://i.pinimg.com/564x/d9/ae/ed/d9aeed870f86aa764ddcd52e70545f28.jpg",
      "https://i.pinimg.com/564x/7a/1d/89/7a1d89ab1ec1ddaa050bef44b20a0daf.jpg",
      "https://i.pinimg.com/564x/0f/40/fe/0f40feea9bb5aa8f721edd8dd3c5fac9.jpg",
      "https://i.pinimg.com/564x/31/a6/ba/31a6baf310e1585a371cf2a501f21065.jpg",
      "https://i.pinimg.com/736x/be/11/63/be1163d5e5f9c12f2ea6c8dd2973ee8f.jpg",
      "https://i.pinimg.com/564x/9b/1a/1f/9b1a1f6ef744485d08f63548a1346487.jpg",
      "https://i.pinimg.com/564x/d1/e0/22/d1e0226cf3d1e290757242efb8b5e1a1.jpg",
      "https://i.pinimg.com/736x/ff/3d/51/ff3d510b80d5b90cec94797207c3566b.jpg",
      "https://i.pinimg.com/564x/73/93/87/739387e5eae379c9768ba13b13a56554.jpg",
      "https://i.pinimg.com/564x/ff/94/91/ff949123b872c4aee9132ad5031bccb4.jpg",
      "https://i.pinimg.com/736x/25/47/55/254755759d06aa01f5d33c19f6354e12.jpg",
      "https://i.pinimg.com/564x/4c/b7/8b/4cb78b6f9b0a0621dc7f4266e02c5a07.jpg",
      "https://i.pinimg.com/564x/e9/f8/0e/e9f80efa1e692d161db35c48f69d7846.jpg",
      "https://i.pinimg.com/564x/52/ca/00/52ca00a2f599d4db66d3019ad28162ed.jpg",
      "https://i.pinimg.com/564x/03/ee/8b/03ee8be162e4cc744bb46bf2cd02c5dc.jpg",
      "https://i.pinimg.com/736x/80/53/46/8053462e12f91ab8d9192d020eb48f64.jpg",
      "https://i.pinimg.com/736x/25/98/c5/2598c5dcc140d8603bd2abcd75db722a.jpg",
      "https://i.pinimg.com/736x/76/c2/b7/76c2b7a2fbe3fd5e53c8469e3ff56312.jpg",
      "https://i.pinimg.com/736x/9b/46/fa/9b46fa01e59ac883a1eb26be06b4d477.jpg",
      "https://i.pinimg.com/736x/66/8a/a1/668aa19333007f57527db3bdccda421c.jpg",
      "https://i.pinimg.com/564x/54/2c/17/542c17de3a2ef85dd4a15fab1986d20c.jpg",
      "https://i.pinimg.com/564x/15/60/0e/15600ed3de14930e7710e308a2fd5fdd.jpg",
      "https://i.pinimg.com/736x/59/26/2f/59262f4f65d66de123a3f705efc7801c.jpg",
      "https://i.pinimg.com/564x/ed/17/46/ed1746b6cf0ceeccde660c680d586bf5.jpg",
      "https://i.pinimg.com/564x/76/5b/85/765b851263217bcbeb0a5b12a703b118.jpg",
      "https://i.pinimg.com/736x/55/8c/38/558c383c5d30033ceda43ee1f29e9052.jpg",
      "https://i.pinimg.com/736x/50/81/6a/50816a38bbddc0839cf0c8609b9d3010.jpg",
      "https://i.pinimg.com/736x/f3/3e/95/f33e95c771b2372a5fa04b6612eb8025.jpg",
      "https://i.pinimg.com/736x/61/45/bd/6145bdf3cdaebe6e5cfd30beef9a4474.jpg",
      "https://i.pinimg.com/736x/b4/62/1f/b4621f9ac7dab4ebdf34242cc98dc458.jpg",
      "https://i.pinimg.com/736x/6d/2d/cf/6d2dcff41e4c428f9273b6f7e108464a.jpg",
      "https://i.pinimg.com/736x/e2/73/9f/e2739fa98da937beb8efdf79cc4f07aa.jpg",
      "https://i.pinimg.com/474x/08/ee/fe/08eefec642e90090a4ecae94f0d8a10b.jpg",
      "https://i.pinimg.com/736x/ac/d0/6b/acd06b9ea9ebbff6f8aa7b3e89ca0909.jpg",
      "https://i.pinimg.com/736x/56/ef/92/56ef929de79bd8e12f2b2bcdc127f563.jpg",
      "https://i.pinimg.com/736x/fc/6c/fe/fc6cfee853be9edf39ac067eea94b9be.jpg",
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
        color: Colors.black45,
        onRefresh: _refreshImages,
        child: Scrollbar(
          controller: _scrollController,
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8.0),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2, // برای نمایشگرهای بزرگتر در وب 4 ستون و در اندروید 2 ستون
              crossAxisSpacing: 11.0,
              mainAxisSpacing: 11.0,
              childAspectRatio: MediaQuery.of(context).size.width > 800 ? 0.7 : 0.8,
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