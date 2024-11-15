import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class hackPage extends StatefulWidget {
  const hackPage({super.key});

  @override
  State<hackPage> createState() => _hackPageState();
}

class _hackPageState extends State<hackPage> {
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
      "https://i.pinimg.com/736x/16/0d/18/160d182144e963f94b26f2ecef0e5e62.jpg",
      "https://i.pinimg.com/736x/6c/52/fb/6c52fb34dc4e3d6c22f3d9ebd2289d45.jpg",
      "https://i.pinimg.com/736x/06/64/bc/0664bca899a789577effe2000b8cb09e.jpg",
      "https://i.pinimg.com/736x/42/c2/03/42c203571713688686724e9d150e050b.jpg",
      "https://i.pinimg.com/736x/fa/e7/14/fae7144d5d72e74bdaf60591833b6522.jpg",
      "https://i.pinimg.com/736x/82/76/86/827686d4b8f839441fa4a2319679c0aa.jpg",
      "https://i.pinimg.com/736x/4c/8c/b4/4c8cb4252612041e1b60b26265928daa.jpg",
      "https://i.pinimg.com/736x/cc/23/aa/cc23aa999e0423b68f16d0d2ef240acc.jpg",
      "https://i.pinimg.com/736x/70/42/c5/7042c5c63904df8bc3e041f1ba465fb2.jpg",
      "https://i.pinimg.com/736x/cc/03/21/cc0321e5ee30665f35abe2f2c0a3d7c0.jpg",
      "https://i.pinimg.com/736x/40/e1/1d/40e11db67ac35382751925f867b740ec.jpg",
      "https://i.pinimg.com/736x/0f/c4/3f/0fc43f2080f7d0f6af49f6ec63b287c8.jpg",
      "https://i.pinimg.com/736x/f1/40/ea/f140ea6c99d2ee8a05cf256afe80125d.jpg",
      "https://i.pinimg.com/736x/4e/58/ac/4e58ac7226386750edb3cee7d1a06705.jpg",
      "https://i.pinimg.com/736x/69/bf/a6/69bfa63a88b9da9e999ed47b2702fdbc.jpg",
      "https://i.pinimg.com/736x/2e/70/2b/2e702bb3ae2fb16cd92052bea295db50.jpg",
      "https://i.pinimg.com/1200x/d0/cc/cb/d0cccb9ce992142a65d15f26a70ebb55.jpg",
      "https://i.pinimg.com/736x/e6/2b/85/e62b85f812c485426db49dd8a9ec5ce8.jpg",
      "https://i.pinimg.com/736x/e5/35/b9/e535b9d6108cccbca193249a4fd0959d.jpg",
      "https://i.pinimg.com/736x/07/63/79/07637948dae898ddba4e8585cad4f33e.jpg",
      "https://i.pinimg.com/736x/a3/59/a5/a359a5489155544da0e47177da0b1416.jpg",
      "https://i.pinimg.com/736x/bd/d9/fa/bdd9fa2f111ee9fd3a1bc83a62314177.jpg",
      "https://i.pinimg.com/736x/91/84/ae/9184aeef1b47443ee9d1f3fc5df67e0e.jpg",
      "https://i.pinimg.com/736x/32/27/cb/3227cb6fbf680d80b4165009bb1a1761.jpg",
      "https://i.pinimg.com/736x/4d/f6/d9/4df6d9ff8a0af2beb844b07e84752625.jpg",
      "https://i.pinimg.com/736x/0a/c4/71/0ac47189c41306bbd0c2fba80f573ed4.jpg",
      "https://i.pinimg.com/736x/86/01/b1/8601b1511b1986fc1e52410a9daa7e87.jpg",
      "https://i.pinimg.com/736x/d9/83/c8/d983c8db903b8d323d87cb5330d6a4db.jpg",
      "https://i.pinimg.com/736x/db/dc/f3/dbdcf3ad5d267009a0b9b8a6d53ac200.jpg",
      "https://i.pinimg.com/736x/93/b6/67/93b667eb0fb64e6971c78f20f7d4c688.jpg",
      "https://i.pinimg.com/736x/9b/45/07/9b45078212d671cb3e604abfa387e526.jpg",
      "https://i.pinimg.com/736x/ad/72/45/ad7245cd9c54af4f1569d3d0da98905b.jpg",
      "https://i.pinimg.com/736x/35/c9/9b/35c99bb788b97193162bcc82c363a8f2.jpg",
      "https://i.pinimg.com/736x/fb/18/b7/fb18b7eb1731896213caaebeadf24f37.jpg",
      "https://i.pinimg.com/736x/32/f4/de/32f4deb8f81ea7bdc6200c19f591cd08.jpg",
      "https://i.pinimg.com/736x/05/98/80/059880b02bfad4acd9bb89bc2b79ae1d.jpg",
      "https://i.pinimg.com/736x/ff/1b/c2/ff1bc2dc7b26846b5587bc77dbf7ef62.jpg",
      "https://i.pinimg.com/736x/02/ee/9e/02ee9eb14341a5fa46b38312289b0451.jpg",
      "https://i.pinimg.com/736x/79/b1/ee/79b1eed3a59be0827443bea4d5c5067d.jpg",
      "https://i.pinimg.com/736x/86/44/2d/86442d5c39360cd075bd9961300ede61.jpg",
      "https://i.pinimg.com/736x/6e/48/76/6e48765d901e3b570d46fe3b01bbf3d6.jpg",
      "https://i.pinimg.com/736x/70/e2/b8/70e2b89373ab076713c24286f0cdbb1e.jpg",
      "https://i.pinimg.com/736x/02/56/42/025642685f4b07a21d4b0ba501da49e2.jpg",
      "https://i.pinimg.com/736x/df/ed/89/dfed893bbad539185c0988223661e8ad.jpg",
      "https://i.pinimg.com/736x/37/9a/aa/379aaa1fe71fe8eebeb574117b42cf10.jpg",
      "https://i.pinimg.com/736x/08/cf/b5/08cfb519c598e970c9ffbe31fc5c866b.jpg",
      "https://i.pinimg.com/736x/27/48/2f/27482fb6c35ca11461f7eb5249a92bc1.jpg",
      "https://i.pinimg.com/736x/50/af/42/50af42cb59ac227aa868db9eae92303e.jpg",
      "https://i.pinimg.com/736x/53/d4/7b/53d47b6cf30334303bdbf23f40adbaef.jpg",
      "https://i.pinimg.com/736x/5f/39/bf/5f39bf8c21aedef3dd1c9b9238ac1042.jpg",
      "https://i.pinimg.com/736x/2c/dd/31/2cdd31d9e6fe6dde7de64a295fd8ef4e.jpg",
      "https://i.pinimg.com/736x/0a/0d/dd/0a0ddda11faa4b061ff1515a292f9626.jpg",
      "https://i.pinimg.com/1200x/02/56/42/025642685f4b07a21d4b0ba501da49e2.jpg",
      "https://i.pinimg.com/736x/0c/92/94/0c92944d2dd68d52c81dd66b55b47aec.jpg",
      "https://i.pinimg.com/736x/72/7a/a2/727aa225f397644c78d6a7ba769861b0.jpg",
      "https://i.pinimg.com/736x/d1/7d/42/d17d424fd51601008ba1776d4ddd1108.jpg",
      "https://i.pinimg.com/736x/a6/bd/b9/a6bdb9664d21113f26e1effa5c9d24ab.jpg",
      "https://i.pinimg.com/736x/52/ac/7a/52ac7ae7c777a4ec7dbfeb8fdb1e696c.jpg",
      "https://i.pinimg.com/736x/17/49/5b/17495b81ce40b4ebbe0b03fc9f17af2b.jpg",
      "https://i.pinimg.com/736x/c9/66/9f/c9669fe9bbd474212ecd27a8664ae3da.jpg",
      "https://i.pinimg.com/736x/0a/25/27/0a25270847a52c0a0ebb46361cd311c5.jpg",
      "https://i.pinimg.com/736x/46/c1/e8/46c1e860cb803552941bb98fbbd3bdcc.jpg",
      "https://i.pinimg.com/736x/d0/1c/11/d01c11371359d6159c9cdb5ffd894de1.jpg",
      "https://i.pinimg.com/736x/a6/a9/72/a6a972da9a0fdb027b186fae1774f333.jpg",
      "https://i.pinimg.com/736x/70/c1/1e/70c11ece00b955b7f2efb6864b840570.jpg",
      "https://i.pinimg.com/736x/03/7f/61/037f6106384053f899b8adca2c21ca08.jpg",
      "https://i.pinimg.com/736x/41/0b/1c/410b1cfef7ab207e06beb11f540b4207.jpg",
      "https://i.pinimg.com/736x/e4/47/1e/e4471e09584d5f02367861e57d823fd4.jpg",
      "https://i.pinimg.com/736x/f4/76/d8/f476d8cad14a9b202d8b2620cf51d72c.jpg",
      "https://i.pinimg.com/736x/8e/52/aa/8e52aac552246f33b8ec11d0721d6d01.jpg",
      "https://i.pinimg.com/736x/b1/14/aa/b114aabb4da2dbd8d9a638a117804a59.jpg",
      "https://i.pinimg.com/736x/10/15/4e/10154efd9483898825c0efcf5043e67e.jpg",
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
