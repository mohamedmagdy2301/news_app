import 'package:flutter/material.dart';
import 'package:news_app/screen/home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  // GetAllNewsService().request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: SplashScreenView(
        navigateRoute: const HomePage(),
        duration: 2000,
        imageSize: 280,
        imageSrc: "assets/splash.png",
        backgroundColor: const Color.fromARGB(255, 255, 253, 244),
        text: "News",
        // speed: 770,
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 110,
          fontWeight: FontWeight.bold,
          fontFamily: "PlaywriteDKUloopet",
        ),
        colors: const [
          Color.fromARGB(246, 240, 172, 47),
          Color.fromARGB(246, 240, 172, 47),
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 255, 149, 0),
        ],
      ),
    );
  }
}
