import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../image_Details.dart';

class FourKPage extends StatefulWidget {
  const FourKPage({super.key});

  @override
  State<FourKPage> createState() => _FourKPageState();
}

class _FourKPageState extends State<FourKPage> {
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
      'https://i.pinimg.com/564x/36/99/b7/3699b7ccc2270351378c89d0f47cd07c.jpg',
      'https://i.pinimg.com/736x/8d/11/a5/8d11a59435c955b5b205435c25991be7.jpg',
      'https://i.pinimg.com/736x/31/9b/de/319bde10994a4e0f10945cb32791fd62.jpg',
      'https://i.pinimg.com/736x/6b/de/76/6bde76c24a6130e6a8e5939fe3682e56.jpg',
      'https://i.pinimg.com/1200x/0f/f3/b4/0ff3b454e12e64ee2eea2c66383498f2.jpg',
      'https://i.pinimg.com/736x/85/3f/7b/853f7bb64712d14e5a7abd88a2750592.jpg',
      'https://i.pinimg.com/564x/18/f3/82/18f38278a5a859dc63ac8fd6054f0fb9.jpg',
      'https://i.pinimg.com/originals/27/d6/0a/27d60ab865c2ab7dab6895ee5d0a3cfc.jpg',
      'https://i.pinimg.com/736x/93/64/a4/9364a4c1f2ca29a5323a06fb50576594.jpg',
      'https://i.pinimg.com/736x/5e/82/c4/5e82c4ebb30038857564ca7347548a72.jpg',
      'https://i.pinimg.com/564x/c8/da/b9/c8dab9651f9cccd3c99b3f012d4d9938.jpg',
      'https://i.pinimg.com/564x/a0/22/72/a02272a09e19cbde34485f57542c064f.jpg',
      'https://i.pinimg.com/736x/6b/54/9d/6b549d8bc4d768f87b68095566c8bad0.jpg',
      'https://i.pinimg.com/736x/e2/50/f3/e250f39fc8540c83d7773e297eeb78b5.jpg',
      'https://i.pinimg.com/564x/31/e3/db/31e3db1d9d929006f4def2153cb1bac1.jpg',
      'https://i.pinimg.com/1200x/00/b0/8a/00b08a71942124d25348b2397d62574f.jpg',
      'https://i.pinimg.com/736x/22/e9/a1/22e9a1dae889ddf040360d82501244f3.jpg',
      'https://i.pinimg.com/1200x/b5/aa/03/b5aa03c8bb6b05a213ec905678f598a6.jpg',
      'https://i.pinimg.com/564x/92/95/36/92953619dc02e52de1c537a1ef945dcd.jpg',
      'https://i.pinimg.com/736x/28/ca/b3/28cab3caa69892dbbaadfd29d9022651.jpg',
      'https://i.pinimg.com/736x/ab/4a/21/ab4a211d2d09c8bac20bc7585586f21f.jpg',
      'https://i.pinimg.com/1200x/fd/48/d0/fd48d00902b04db53fd6ad5bc58d360a.jpg',
      'https://i.pinimg.com/736x/e8/e7/25/e8e7251f67e181b4616a2fc97e3ab7fc.jpg',
      'https://i.pinimg.com/564x/f0/38/16/f038169ea7ecfe9239cce56a648cf0a1.jpg',
      'https://i.pinimg.com/736x/90/c7/06/90c706b53e2799703b19dd29b446bb95.jpg',
      'https://i.pinimg.com/564x/50/0d/12/500d12685588710867dcae4013dd8efc.jpg',
      'https://i.pinimg.com/564x/4c/44/d5/4c44d5f23f30651ea263cf46ffd2e556.jpg',
      'https://i.pinimg.com/564x/3f/d8/f4/3fd8f42102735668d9a6b85dbf71e31c.jpg',
      'https://i.pinimg.com/736x/a3/14/11/a31411841ebf95249f0d43a19f5ec470.jpg',
      'https://i.pinimg.com/736x/50/7f/e6/507fe60017d745bd445315f5f242a3e2.jpg',
      'https://i.pinimg.com/736x/49/6b/6c/496b6c785783a20c8cf3aca7e407a7b4.jpg',
      'https://i.pinimg.com/736x/95/9e/ca/959eca7ee3f9b4b84ff78f16d8294c7a.jpg',
      'https://i.pinimg.com/564x/9a/9c/9f/9a9c9f89aa1a4b69d2b1a4364425ed57.jpg',
      'https://i.pinimg.com/736x/0d/e2/5f/0de25fbd99c843e054fe2ccf4c98fded.jpg',
      'https://i.pinimg.com/736x/af/94/8e/af948ebcbaa3ad4d314df267ba633a1f.jpg',
      'https://i.pinimg.com/736x/70/37/53/703753db8105f200ea74fb1f8fc61bb4.jpg',
      'https://i.pinimg.com/564x/79/73/15/797315625b10955d90bfd931db124144.jpg',
      'https://i.pinimg.com/564x/da/3c/a1/da3ca1edda048d8024a6a3b3f57bafbf.jpg',
      'https://i.pinimg.com/1200x/e8/a1/14/e8a114cf32c5f24a4d2a0d9d8810976e.jpg',
      'https://i.pinimg.com/736x/3e/5b/6d/3e5b6d61fac8118e05d449959417c579.jpg',
      'https://i.pinimg.com/1200x/ae/71/d2/ae71d2d1438e3c1cd98df4b6d60c06dd.jpg',
      'https://i.pinimg.com/1200x/b6/f5/9b/b6f59bfaf368e7250f16566c922d6adf.jpg',
      'https://i.pinimg.com/564x/5b/25/cd/5b25cd4f37514cb2a786dd4d7541b5c1.jpg',
      'https://i.pinimg.com/564x/16/d5/cb/16d5cb4c0ae0dcb038dd3cc10d29fc1f.jpg',
      'https://i.pinimg.com/564x/53/76/e1/5376e10d286adf842b1f3e8fbc17779e.jpg',
      'https://i.pinimg.com/564x/5d/3e/94/5d3e94cd79e6a4dd3386f32c38e03afd.jpg',
      'https://i.pinimg.com/564x/6a/e8/da/6ae8da4c2dafff974a94afac676600d6.jpg',
      'https://i.pinimg.com/736x/12/44/b4/1244b41aa54d883d96341415a1e4bff2.jpg',
      'https://i.pinimg.com/564x/bd/9b/d9/bd9bd944dd60ff0c88cc6128a6fd39f0.jpg',
      'https://i.pinimg.com/736x/72/c5/69/72c5697162912e27c4752a215321ddf8.jpg',
      'https://i.pinimg.com/1200x/f0/de/8f/f0de8ff01da7d79f510077f34aceffab.jpg',
      'https://i.pinimg.com/474x/ae/64/ef/ae64efb9bb032b9d734b47d6cdeb0a34.jpg',
      'https://i.pinimg.com/474x/47/ab/a8/47aba871bebbf9bc2cf1f55bc0196ba5.jpg',
      'https://i.pinimg.com/736x/83/29/de/8329de0686dbbe7efb6f391320b9c6b1.jpg',
      'https://i.pinimg.com/736x/68/c6/91/68c691f62b102b9a5e3f58400f0c5617.jpg',
      'https://i.pinimg.com/736x/22/eb/ab/22ebab119548f753d1f0eb055deb01a5.jpg',
      'https://i.pinimg.com/236x/19/41/09/1941095213e18fd8676ed07634b1bb75.jpg',
      'https://i.pinimg.com/736x/89/16/a1/8916a1ced143151ae9af4a11f7c5e170.jpg',
      'https://i.pinimg.com/564x/bf/43/60/bf43609de8e212ac4f5d90fddcd3cfe3.jpg',
      'https://i.pinimg.com/564x/ca/9e/b2/ca9eb288d0af8a23279c8c271abb602c.jpg',
      'https://i.pinimg.com/1200x/48/90/c2/4890c28103e51b2dfcf8ef4e1f48a89e.jpg',
      'https://i.pinimg.com/564x/fa/4e/c1/fa4ec19ac6af43e6e21f647cc6604599.jpg',
      'https://i.pinimg.com/564x/17/21/84/1721847067fca48a93f3142054616025.jpg',
      'https://i.pinimg.com/736x/20/7b/d4/207bd4d7972c3e7ac6974dc8f0759f44.jpg',
      'https://i.pinimg.com/736x/d6/4c/3a/d64c3aff94b2d4906a50b9e13ce23eac.jpg',
      'https://i.pinimg.com/736x/83/e3/d2/83e3d2888a280a4785995db121e76612.jpg',
      'https://i.pinimg.com/564x/13/9e/80/139e80d55a352d1f32dd6f123cfc425c.jpg',
      'https://i.pinimg.com/736x/86/6a/2a/866a2a76ea959f3af3aac2cc8f9b1c3a.jpg',
      'https://i.pinimg.com/564x/b7/21/ab/b721ab7d2dc9a82c1ed87ae2ba869682.jpg',
      'https://i.pinimg.com/736x/41/0e/6c/410e6cfc49cbc6b91c1c33129442dd5a.jpg',
      'https://i.pinimg.com/564x/7a/e5/1a/7ae51a86e4fd549d4f16d1f7468270f9.jpg',
      'https://i.pinimg.com/736x/d4/c0/3b/d4c03b58799253ebee6d1549e6276a52.jpg',
      'https://i.pinimg.com/736x/9a/2f/f0/9a2ff0d42f67fc62732e973b2ee0087b.jpg',
      'https://i.pinimg.com/564x/18/64/b8/1864b8430cfabba14d0c207cc4d0fb46.jpg',
      'https://i.pinimg.com/564x/9a/3e/71/9a3e711f0c12bfefbacfdda1f2173c0b.jpg',
      'https://i.pinimg.com/736x/17/b1/33/17b133d9218587accd62012969f1a9c1.jpg',
      'https://i.pinimg.com/736x/de/5a/c2/de5ac2a84aeb1fe7a3c974b336b64478.jpg',
      'https://i.pinimg.com/736x/95/de/00/95de0078730c928e90d22244310b056a.jpg',
      'https://i.pinimg.com/736x/f8/b8/a7/f8b8a7024e1d9571ad72b8c04e122c1a.jpg',
      'https://i.pinimg.com/736x/eb/82/90/eb8290d1e8fa95d87dfb5179573c3ebf.jpg',
      'https://i.pinimg.com/736x/16/c0/34/16c0344a39fec0685304613bf8f19d7c.jpg',
      'https://i.pinimg.com/736x/a4/ae/fc/a4aefcf4d4e4e6836dfa2ce77da12b38.jpg',
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
