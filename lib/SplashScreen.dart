import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'package:wallpaper/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const HomeScreen(),
            duration: const Duration(seconds: 1),
            isIos: true,
            type: PageTransitionType.leftToRight,
          ),
        );
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Center(
            child: Lottie.asset(
              'assets/Animation - 1731004438456.json', // مسیر فایل Lottie
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
         Column(
           children: [
             // استفاده از animated_text_kit به جای animate_text
             DefaultTextStyle(
               style: const TextStyle(
                 fontSize: 19,
                 color: Colors.white,
               ),
               child: AnimatedTextKit(
                 animatedTexts: [
                   TyperAnimatedText('Welcome to Perfect Wallpaper',textStyle: const TextStyle(decoration: TextDecoration.underline), speed: const Duration(milliseconds: 100)),
                 ],
                 isRepeatingAnimation: false,
               ),
             ),
             Lottie.asset(
               'assets/ykSGgU0Mzv (1).json',
               width: 200,
               height: 200,
               fit: BoxFit.cover,
             ),
           ],
         ),
        ],
      ),
    );
  }
}