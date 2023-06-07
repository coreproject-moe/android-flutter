import 'package:flutter/material.dart';
import 'components/home/carousel.dart';
import "./theme.dart";

void main() {
  runApp(const CoreProjectApp());
}

class CoreProjectApp extends StatelessWidget {
  const CoreProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CoreProjectTheme,
      home: Scaffold(
          body: Carousel(
              width: MediaQuery.of(context).size.width, // make it full width
              height: 400,
              data: const [
            {'name': 'sora', 'background_image': "assets/images/1.jpg"},
            {'name': 'amamiya', 'background_image': "assets/images/2.jpg"},
            {'name': 'Soraaa', 'background_image': "assets/images/3.jpg"}
          ])),
    );
  }
}
