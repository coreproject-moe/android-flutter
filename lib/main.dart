import 'package:flutter/material.dart';
import "./components/carousel.dart";

void main() {
  runApp(const CoreProjectApp());
}

class CoreProjectApp extends StatelessWidget {
  const CoreProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Carousel(
              width: MediaQuery.of(context).size.width, // make it full width
              height: 400,
              data: const [
            {'name': 'sora', 'background_image': "assets/images/1.jpg"}
          ])),
    );
  }
}
