import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../image_Details.dart';

class ronaldoPage extends StatefulWidget {
  const ronaldoPage({super.key});

  @override
  State<ronaldoPage> createState() => _ronaldoPageState();
}

class _ronaldoPageState extends State<ronaldoPage> {
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
      "https://i.pinimg.com/564x/94/23/50/9423501a8c606b4b7efa34d394a3cba6.jpg",
      "https://i.pinimg.com/1200x/9e/a1/b4/9ea1b406f3d38306297536d04fb1e07e.jpg",
      "https://i.pinimg.com/736x/a3/b7/e6/a3b7e6255c3c54a5d379d947837c4233.jpg",
      "https://i.pinimg.com/564x/71/f4/fe/71f4feee43e447922a585745a6848ecb.jpg",
      "https://i.pinimg.com/736x/7d/87/61/7d8761e59f58728fa3c1907e11a33286.jpg",
      "https://i.pinimg.com/564x/4f/d1/bc/4fd1bca0dd74b42ab0acb21908219062.jpg",
      "https://i.pinimg.com/564x/7a/9c/54/7a9c54d393376449e1ac7e7e212d7fa7.jpg",
      "https://i.pinimg.com/736x/1f/d5/c8/1fd5c881acad4b77148698b0b3da3c70.jpg",
      "https://i.pinimg.com/564x/a9/c2/db/a9c2db79e5065852ce9f402c6903961c.jpg",
      "https://i.pinimg.com/564x/9b/36/a3/9b36a382e671bfe02435436cf0c2899e.jpg",
      "https://i.pinimg.com/736x/85/06/4c/85064cc7d008a3d930f4b8e96c58abd1.jpg",
      "https://i.pinimg.com/564x/74/32/9d/74329da7bbacc05d7f5e9527bde943a0.jpg",
      "https://i.pinimg.com/1200x/33/a2/ad/33a2ad1ddc8bafe34ae91f55601f3407.jpg",
      "https://i.pinimg.com/736x/54/05/0f/54050ff392d36c48f39f311e4db463b8.jpg",
      "https://i.pinimg.com/736x/42/65/f9/4265f9933c797217d5194369cd281c5e.jpg",
      "https://i.pinimg.com/736x/a9/37/36/a937365f1c96271353671482ecc4a47f.jpg",
      "https://i.pinimg.com/736x/02/bb/27/02bb27db79d9c8f459c608f3718e3755.jpg",
      "https://i.pinimg.com/564x/1d/08/32/1d0832f9bfe74691d08bbf159a4b14e4.jpg",
      "https://i.pinimg.com/736x/73/3f/59/733f59163a9ec1128c1935c4e3b33787.jpg",
      "https://i.pinimg.com/736x/dc/e1/df/dce1df78b6c93a15aa4a420bd60f5cd0.jpg",
      "https://i.pinimg.com/736x/59/ab/25/59ab257ffb0e26229a3127219f2e69de.jpg",
      "https://i.pinimg.com/564x/23/19/b0/2319b078cd6ef2217cea095ccd2afda1.jpg",
      "https://i.pinimg.com/1200x/33/a6/90/33a69076b67d371ceaf417bc33eb4a12.jpg",
      "https://i.pinimg.com/736x/34/11/58/341158731072b1977a9c027f9ea723fd.jpg",
      "https://i.pinimg.com/736x/36/d0/a9/36d0a9062cb81060a74741a3ddeb96d3.jpg",
      "https://i.pinimg.com/736x/92/e2/6c/92e26c789caa6b88c4f4ba64f9862b35.jpg",
      "https://i.pinimg.com/736x/cb/5d/6c/cb5d6c8874c7334cbafa2fe2ed0cc2f0.jpg",
      "https://i.pinimg.com/736x/cc/2c/f8/cc2cf85e729690540b5952d8bde08d8c.jpg",
      "https://i.pinimg.com/564x/fd/43/17/fd431727def51dae58908c9203d8d7db.jpg",
      "https://i.pinimg.com/736x/f2/0f/66/f20f66868b89c27866e149f5f8845ca2.jpg",
      "https://i.pinimg.com/736x/d7/ff/cb/d7ffcb8f2ae5fa8528dc9d9589202ac4.jpg",
      "https://i.pinimg.com/736x/52/b5/d6/52b5d6aa2a9740fbbb7d5c1cd7ba5440.jpg",
      "https://i.pinimg.com/1200x/d6/8c/07/d68c07634f3eb4670c41f8e5dd26f7bd.jpg",
      "https://i.pinimg.com/736x/94/fd/b4/94fdb4f21002ab9212d2d6343d0eff67.jpg",
      "https://i.pinimg.com/1200x/28/45/48/28454859d1ee17c35500aad995f9c293.jpg",
      "https://i.pinimg.com/736x/2b/45/0f/2b450f59b85cd88043482446e3b4c49f.jpg",
      "https://i.pinimg.com/1200x/38/ee/b4/38eeb44b178a93df1fc2b3e97af53dc2.jpg",
      "https://i.pinimg.com/736x/81/5d/bd/815dbd0661ca5d177d2291f1bd6491a7.jpg",
      "https://i.pinimg.com/564x/46/cb/ea/46cbeaf92ab7a678173e896bbbaf4daf.jpg",
      "https://i.pinimg.com/736x/a3/59/0d/a3590d569233bc21ac3e0d20501185b3.jpg",
      "https://i.pinimg.com/736x/b2/e9/2d/b2e92d8d0801a8a5a6d23be60a694807.jpg",
      "https://i.pinimg.com/736x/f6/0d/18/f60d18ad8dfb10ee72f26041cb3d8c8d.jpg",
      "https://i.pinimg.com/564x/ad/76/6a/ad766a54caebb5c6abaf06d093575b0a.jpg",
      "https://i.pinimg.com/736x/43/df/2b/43df2bbf6d3d5e6e299b87561dc38d9f.jpg",
      "https://i.pinimg.com/1200x/bd/d0/cc/bdd0cc016a838d41a599dea7a7117ee7.jpg",
      "https://i.pinimg.com/564x/88/38/71/8838714b7b476611a49c25c6fb81286a.jpg",
      "https://i.pinimg.com/736x/67/b6/a6/67b6a6e8d650f2ca3e49fb2a794ac42f.jpg",
      "https://i.pinimg.com/736x/66/dd/f9/66ddf90247902863a38fe31c71dbe84b.jpg",
      "https://i.pinimg.com/736x/0d/5c/30/0d5c3038abdb9adb9889925f53f014cf.jpg",
      "https://i.pinimg.com/736x/ad/b8/32/adb832174f3a9fdc48016b2e7e36f0a7.jpg",
      "https://i.pinimg.com/564x/b6/f5/b0/b6f5b045b2943b93ddbd85fa47b469d2.jpg",
      "https://i.pinimg.com/736x/b6/41/54/b6415463443f2d7a80f520c2c6bdc574.jpg",
      "https://i.pinimg.com/736x/a5/2c/2f/a52c2f1ea591159c802dd9a6f0456190.jpg",
      "https://i.pinimg.com/736x/37/20/75/37207536045fd7edfc289776ea537dd3.jpg",
      "https://i.pinimg.com/564x/68/be/c4/68bec4ee0ebd713f21a026a48765930c.jpg",
      "https://i.pinimg.com/736x/a1/45/66/a14566d85dd8c986a63243b55571e923.jpg",
      "https://i.pinimg.com/564x/ee/c2/e3/eec2e3af148682293b9b65c25b1e2b4a.jpg",
      "https://i.pinimg.com/736x/eb/02/69/eb0269c61a9495a629d7dc7acf16a9e4.jpg",
      "https://i.pinimg.com/564x/e4/8a/e1/e48ae11b3da2099753b2438ab08a46a1.jpg",
      "https://i.pinimg.com/1200x/50/0f/57/500f57d4d5619a6955ce886351c84822.jpg",
      "https://i.pinimg.com/736x/b7/c0/29/b7c0296ed6b9e9cd06a33b8758a2ff03.jpg",
      "https://i.pinimg.com/564x/60/ea/3a/60ea3ae16d9bf18a08f8aa4931fefb31.jpg",
      "https://i.pinimg.com/1200x/5d/cb/7a/5dcb7ad5dea8e343cd64eb1a6ec6530c.jpg",
      "https://i.pinimg.com/736x/96/54/17/9654173ffa63e2811ee6e89d2d6940dd.jpg",
      "https://i.pinimg.com/564x/85/0c/15/850c1511371549db8d80ed426f377513.jpg",
      "https://i.pinimg.com/736x/42/12/f2/4212f23e0759584e9c8d4ab00bf0aeb7.jpg",
      "https://i.pinimg.com/564x/ea/82/b9/ea82b9a41230d9b2dc1d36ef327a8e2f.jpg",
      "https://i.pinimg.com/736x/b8/34/51/b83451a446023c3b605984598aeb6214.jpg",
      "https://i.pinimg.com/564x/ed/8f/57/ed8f57a8e0132be4ffbfe26a64927741.jpg",
      "https://i.pinimg.com/564x/16/1f/33/161f33ae6e038d7c6e1a621ab3490bd0.jpg",
      "https://i.pinimg.com/564x/fb/30/8a/fb308a6f0861a03c9eaf075a02994dad.jpg",
      "https://i.pinimg.com/564x/de/6d/07/de6d07e3d88b85c0dfdc7ab67b7b84a2.jpg",
      "https://i.pinimg.com/564x/08/8f/16/088f165f6c1bef9c029906d25e2c0680.jpg",
      "https://i.pinimg.com/564x/dc/d8/16/dcd8169491e8bbc8b0127e43c82aec5a.jpg",
      "https://i.pinimg.com/736x/d0/44/09/d04409ac7fdaf016104a40415e424af5.jpg",
      "https://i.pinimg.com/736x/af/ab/58/afab58f604cb6c3477a1b9037a4bf4c1.jpg",
      "https://i.pinimg.com/736x/57/07/de/5707de32651043bf27c67d1695ed6edf.jpg",
      "https://i.pinimg.com/736x/f9/09/db/f909db3a42f8187a55a783f850b17dc8.jpg",
      "https://i.pinimg.com/564x/47/ab/05/47ab05a9cafda57aa83899c0a37a3de4.jpg",
      "https://i.pinimg.com/564x/8d/1e/8d/8d1e8dca23aba2e60f2f2a91c572bc03.jpg",
      "https://i.pinimg.com/564x/e6/09/41/e609410d21380259dad4fa96bd26720e.jpg",
      "https://i.pinimg.com/564x/35/0d/85/350d85a72ec898473ae72dfea6b50e0f.jpg",
      "https://i.pinimg.com/564x/2d/f8/80/2df8802dbbb56126bc4679f78afec818.jpg",

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
