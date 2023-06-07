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
  late int _index;

  @override
  void initState() {
    _index = 0;
    super.initState();
  }

  void addOneToIndex(){
    if (_index +1 == widget.data.length){
     setState(() {
       _index = 0;
     });
    } else {
      setState(() {
        _index +=1;
      });
    }
  }

  void minusOneToIndex(){
    if (_index  == 0){
      setState(() {
        _index = widget.data.length - 1;
      });
    }
    else {
      setState(() {
        _index -=1;
      });
    }
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
        else if  (dragEndDetails.primaryVelocity! > 0) {
          minusOneToIndex();
        }
      },

      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedOpacity(
            duration: const Duration(milliseconds:  500),
            opacity: 1.0,
            child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(specificData['background_image']!),
                  fit: BoxFit.cover),
            ),
            child: const Center(child: FlutterLogo(size: 300)),
          ),
        ),
      ),
    );
  }
}
