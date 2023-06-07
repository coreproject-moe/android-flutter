import 'package:flutter/material.dart';
import "./components/fading_image_slider.dart";
void main (){
  runApp(const CoreProjectApp());
}

class CoreProjectApp extends StatelessWidget {
  const CoreProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: FadingImagesSlider(
          textAlignment: Alignment.center,
          texts: const [
            Text(
              'test',
            ),
            Text(
              'test2',
            )
          ],
          images: [
            Image.asset('assets/images/1.jpg'),
            Image.asset('assets/images/2.jpg')
          ],
        ),
      ),
    );
  }
}
