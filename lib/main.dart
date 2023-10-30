import 'package:coreproject/components/geckoview.dart';
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
            body: GeckoView(
      key: key,
    )));
  }
}
