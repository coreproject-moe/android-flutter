import 'dart:async';
import 'dart:ui';

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
  bool isBlurShown = false;
  late int _index;

  @override
  void initState() {
    isBlurShown = false;
    _index = 0;
    super.initState();
  }

  void addBlur() {
    isBlurShown = true;
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        isBlurShown = false;
      });
    });
  }

  void addOneToIndex() {
    setState(() {
      if (_index + 1 == widget.data.length) {
        _index = 0;
      } else {
        _index += 1;
      }
      addBlur();
    });
  }

  void minusOneToIndex() {
    setState(() {
      if (_index == 0) {
        _index = widget.data.length - 1;
      } else {
        _index -= 1;
      }

      addBlur();
    });
  }

  @override
  Widget build(BuildContext context) {
    var specificData = widget.data.elementAt(_index);

    return GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          // Swiping in right direction.
          if (dragEndDetails.primaryVelocity! < 0) {
            addOneToIndex();
          }

          // Swiping in left direction.
          else if (dragEndDetails.primaryVelocity! > 0) {
            minusOneToIndex();
          }
        },
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: DecoratedBox(
              key: ValueKey<int>(_index),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(specificData['background_image']!),
                    fit: BoxFit.cover),
              ),
              child: isBlurShown
                  ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    )
                  : const Placeholder(),
            ),
          ),
        ));
  }
}
