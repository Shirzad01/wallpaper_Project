import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Tabs_Page/football.dart';
import 'package:wallpaper/Tabs_Page/hack_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/music_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/nature_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/fourK_Page.dart';
import 'package:wallpaper/Tabs_Page/space_wallpaper.dart';
import 'package:wallpaper/Tabs_Page/travel_wallpaper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  TextEditingController textController = TextEditingController();
  final Connectivity _connectivity = Connectivity();

  // لیست نام تب‌ها
  final List<String> tabs = [
    "Islamic",
    "Space",
    "Nature",
    "Travel",
    "Football",
    "Hack",
    "Music"
  ];

  // لیست ویجت‌های تب‌ها
  final List<Widget> tabWidgets = [
    const FourKPage(),
    const Space(),
    const nature(),
    const travelPage(),
    const football(),
    const hackPage(),
    const musicPage(),
  ];
  @override
  void initState() {
    super.initState();
    _checkConnection();
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.isNotEmpty) {
        _updateConnectionStatus(result.first);
      }
    });
  }

  Future<void> _checkConnection() async {
    ConnectivityResult result =
        (await _connectivity.checkConnectivity()) as ConnectivityResult;
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      // نمایش SnackBar برای حالت آفلاین
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Oops! You are currently offline. Please check your connection.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 6),
          showCloseIcon: true,
        ),
      );
    } else {
      // نمایش SnackBar برای حالت آنلاین
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Great! You are back online.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  // تابع نمایش دیالوگ خروج از برنامه
  Future<bool> _showExitConfirmationDialog() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.black87,
            shadowColor: Colors.white,
            title: const Text('Exit App',style: TextStyle(color: Colors.white),),
            content: const Text('Are you sure you want to exit the app?',style: TextStyle(color: Colors.white),),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pop(false),
                    child: const Text('No',style: TextStyle(color: Colors.white60),),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pop(true),
                    child:  const Text('Yes',style: TextStyle(color: Colors.white60,),),
                  ),
                ],
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showExitConfirmationDialog,
      child: Scaffold(
        appBar: AppBar(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AnimSearchBar(
                  color: Colors.white,
                  textFieldColor: Colors.white12.withOpacity(0.1),
                  textFieldIconColor: Colors.white,
                  suffixIcon: const Icon(Icons.clear, color: Colors.black),
                  width: 400,
                  textController: textController,
                  style: const TextStyle(color: Colors.white),
                  boxShadow: true,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                  onSubmitted: (String value) {
                    print("Search: $value");
                  },
                ),
                const SizedBox(width: 20),
                Text(
                  "Perfect Wallpaper",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: tabWidgets[selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
