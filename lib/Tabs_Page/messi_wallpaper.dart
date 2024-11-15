import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class messiPage extends StatefulWidget {
  const messiPage({super.key});

  @override
  State<messiPage> createState() => _messiPageState();
}

class _messiPageState extends State<messiPage> {
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
      "https://i.pinimg.com/736x/e9/f1/ac/e9f1ac1be3e35d62c72f2118af3da92d.jpg",
      "https://i.pinimg.com/736x/a9/0b/15/a90b1541db9b72a5141bf0fe345b32b5.jpg",
      "https://i.pinimg.com/736x/bc/e2/57/bce2577573e56dc3c7a705803df1a6ee.jpg",
      "https://i.pinimg.com/736x/ab/8c/3f/ab8c3f77bc8878047bbc3e762f9135d5.jpg",
      "https://i.pinimg.com/736x/7e/7f/bd/7e7fbdf9d82ecf799cc57f4231f3c6d3.jpg",
      "https://i.pinimg.com/736x/c6/19/91/c6199194ab826aaedc833babefb49ace.jpg",
      "https://i.pinimg.com/736x/d1/4a/c8/d14ac85368366fbf51b3d546357ad6b9.jpg",
      "https://i.pinimg.com/736x/00/50/f5/0050f55673a2062d6b2770d9e3eb1b14.jpg",
      "https://i.pinimg.com/736x/f8/ca/a4/f8caa47ab0feece778f05188f325bc6a.jpg",
      "https://i.pinimg.com/736x/6c/0b/0e/6c0b0e492035d38ffca1de12c64e0d65.jpg",
      "https://i.pinimg.com/736x/fc/3d/f4/fc3df4405f147db862f841aceee44d55.jpg",
      "https://i.pinimg.com/736x/12/e4/f3/12e4f3038b8c3884dfb30bae1f1ddf44.jpg",
      "https://i.pinimg.com/736x/e8/8c/cb/e88ccb4dd8c71c8b0341f034beb9cc64.jpg",
      "https://i.pinimg.com/736x/fb/fb/46/fbfb46c61a3bdb956ec98df539b9c8b1.jpg",
      "https://i.pinimg.com/736x/12/de/f1/12def18362bee5244020af99c0847e2e.jpg",
      "https://i.pinimg.com/736x/0a/7f/08/0a7f088ceadfb69cca233097331bc7af.jpg",
      "https://i.pinimg.com/736x/2c/04/b9/2c04b9679e9ecb5bb4c05241f15563a6.jpg",
      "https://i.pinimg.com/736x/ba/89/77/ba89777eba4f1490789dc8f1eb8ed084.jpg",
      "https://i.pinimg.com/736x/78/e1/ac/78e1ac8edb5d9ae14b1da38a85e7060e.jpg",
      "https://i.pinimg.com/736x/dc/a5/8c/dca58c669e8890802e99491fb9125402.jpg",
      "https://i.pinimg.com/736x/70/8a/8b/708a8b6f9c776dbc168da4b7c4172f75.jpg",
      "https://i.pinimg.com/736x/d7/3a/f4/d73af42cc4d02e9b8b9cde6fb5b69694.jpg",
      "https://i.pinimg.com/736x/d8/9e/c7/d89ec714e24ed1f3e0743bda4f548d76.jpg",
      "https://i.pinimg.com/736x/aa/67/f1/aa67f1b06d44a4b39f4bec7b424e3b4e.jpg",
      "https://i.pinimg.com/736x/83/20/37/8320378b76c73172661e40e2e190d80b.jpg",
      "https://i.pinimg.com/736x/7f/22/99/7f2299b453b27651417c8be0b7d96438.jpg",
      "https://i.pinimg.com/736x/1f/57/26/1f57260d1129fe61e2b27178a3b6c889.jpg",
      "https://i.pinimg.com/736x/90/4b/3e/904b3e5afe3cd8dc0f3d77d25fd632d1.jpg",
      "https://i.pinimg.com/736x/68/ab/70/68ab70551db76ca41c091430c5b0f73b.jpg",
      "https://i.pinimg.com/736x/32/fb/89/32fb89e8f6ecd72fad5cf4ea275f0641.jpg",
      "https://i.pinimg.com/736x/71/83/30/7183300523f520433a2c72ee5655c08b.jpg",
      "https://i.pinimg.com/736x/7e/a9/9c/7ea99cb7a8beaaa1237f03e583b45d02.jpg",
      "https://i.pinimg.com/736x/97/4c/1c/974c1c6764630dc8d4c773dce1b0748d.jpg",
      "https://i.pinimg.com/736x/a4/0d/2e/a40d2eaa352cdb5c85d9c6ac22600197.jpg",
      "https://i.pinimg.com/736x/f5/9e/02/f59e0216c0f6bf6121bd998d637b5390.jpg",
      "https://i.pinimg.com/736x/47/35/d4/4735d4066e8b1ad77d665c1714cc9fb3.jpg",
      "https://i.pinimg.com/736x/ed/81/b9/ed81b98bb0ad3a91bcae7a5515610926.jpg",
      "https://i.pinimg.com/736x/94/c4/1b/94c41bb898269177f1f3638c53775f3f.jpg",
      "https://i.pinimg.com/736x/ae/87/97/ae879770271177c32ea326a6183ffc0c.jpg",
      "https://i.pinimg.com/736x/aa/6a/b3/aa6ab3b65324c82883d66737a577b6b0.jpg",
      "https://i.pinimg.com/736x/c5/8e/b5/c58eb52c1a5640ffae18c1b3092db84b.jpg",
      "https://i.pinimg.com/736x/2e/19/09/2e190983b2d10a2b6aee21c0078cc8de.jpg",
      "https://i.pinimg.com/736x/14/7d/28/147d28facb0388aab5d65d0a76f91a39.jpg",
      "https://i.pinimg.com/736x/10/8b/68/108b68f4b27188b916df5d0c0f5c85ff.jpg",
      "https://i.pinimg.com/736x/10/8b/68/108b68f4b27188b916df5d0c0f5c85ff.jpg",
      "https://i.pinimg.com/736x/a2/2a/ec/a22aec7acca2b70570a30dcbf08b71db.jpg",
      "https://i.pinimg.com/736x/68/f3/fb/68f3fba907b2f17447a46a1cc6f1874f.jpg",
      "https://i.pinimg.com/736x/b8/6d/61/b86d610fbc909254943f3a262dd400b9.jpg",
      "https://i.pinimg.com/736x/40/f5/1e/40f51e36ef975454fac6cf18ea520bff.jpg",
      "https://i.pinimg.com/736x/52/80/c3/5280c3e4b878a4e5f5004b0bf2ade91c.jpg",
      "https://i.pinimg.com/736x/c8/80/f0/c880f0b522aa48ce1ea8944c78a7bba1.jpg",
      "https://i.pinimg.com/736x/00/20/ed/0020ed8bbf3f199dd769634471006b99.jpg",
      "https://i.pinimg.com/736x/97/81/54/9781542fa6d66cd7c4baacce5c5ef92d.jpg",
      "https://i.pinimg.com/736x/23/6c/67/236c67b81e88d4fb447db48a69b1c209.jpg",
      "https://i.pinimg.com/736x/f5/69/45/f569459c4a65d56157394cfc5f0f3846.jpg",
      "https://i.pinimg.com/736x/1e/c6/80/1ec680f689421b8a6a456308cb398f02.jpg",
      "https://i.pinimg.com/736x/60/45/f6/6045f6b7d3393e35f2fca6de0823d91b.jpg",
      "https://i.pinimg.com/736x/b2/23/b5/b223b58cb80c624b3e415feddf00312b.jpg",
      "https://i.pinimg.com/736x/08/42/3e/08423ee9d91074fcab010985f33016ff.jpg",
      "https://i.pinimg.com/736x/de/26/61/de2661179a0628ce4bbea5372954b369.jpg",
      "https://i.pinimg.com/736x/29/f2/7f/29f27f8da101ab2a72db3610bdb89acf.jpg",
      "https://i.pinimg.com/736x/64/97/29/64972900abe76cfcf6a1db2e9fb6ae71.jpg",
      "https://i.pinimg.com/736x/f6/35/be/f635be3f6e0989b400d5a4ed11bc0b9b.jpg",



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
