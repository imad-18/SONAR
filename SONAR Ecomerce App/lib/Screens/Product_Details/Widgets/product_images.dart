import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductImages extends StatefulWidget {
  final List<String> imagePath;
  final int id;
  const ProductImages({
    super.key,
    required this.imagePath,
    required this.id,
  });

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: widget.id,
          child: Image.asset(
            widget.imagePath[selectedImage],
            width: 220,
            height: 220,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.imagePath.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                child: Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xFFF6625E)
                              .withOpacity(selectedImage == index ? 1 : 0))),
                  child: Image.asset(widget.imagePath[index]),
                ),
              ),
            )),
      ],
    );
  }
}

/*
-to get that nice animation of image expandation, when clicking on a product, 
we use Hero() widget, in the clicked image of the 1st screen & the 2nd image of the other screen,
we give'em a certain unique 'tag'.
int this case we used hero() in 'popularProduct' of 'home' screen and at this screen 
 */