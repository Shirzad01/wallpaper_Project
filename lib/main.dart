import 'package:flutter/material.dart';
import 'package:wallpaper/HomeScreen.dart';

import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor:  const Color.fromARGB(20, 19, 18, 50),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white,),
          bodyLarge: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0x00029f89))
      ),
      home:  SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

