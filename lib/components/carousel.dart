import 'package:flutter/material.dart';


class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.width,
      required this.height,
      required this.data,
      this.backgroundColor = Colors.black});

  final double width;
  final double height;
  final Color? backgroundColor;
  final List<Map<String, String>> data;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var specificData = widget.data.elementAt(index);


    return GestureDetector(
      onPanUpdate: (details) {

        // Swiping in right direction.
        if (details.delta.dx > 0) {
          setState(() {
            index+=1;
          });
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          setState(() {
            index-=1;
          });
        }
      },

      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(specificData['background_image']!),
                fit: BoxFit.cover),
          ),
          child: const Center(child: FlutterLogo(size: 300)),
        ),
      ),
    );
  }
}
