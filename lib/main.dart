import 'package:coreproject/components/geckoview.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import "./components/carousel.dart";

void main() {
  runApp(const CoreProjectApp());
}

class CoreProjectApp extends StatelessWidget {
  const CoreProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: GeckoView(url: 'about:buildconfig'),
    ));
  }
}
