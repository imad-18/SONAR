import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Heart_Icon extends StatelessWidget {
  final bool isFavouritee;
  final void Function()? myOnPressed; 
  const Heart_Icon({
    super.key, 
    required this.isFavouritee,
    this.myOnPressed ,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 40),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: IconButton(
          onPressed: myOnPressed,
          icon: SvgPicture.asset(
              'assets/icons/Heart Icon_2.svg', color: isFavouritee? Colors.red : Colors.grey,),),
    );
  }
}

/*
1-> we create the 'toggleFavorite' function in product_controller file
and we pass to it the whole object from 'PopularModel' class
2-> we declared a 'myOnPressed' fct to the the default 'onPressed' property
in order to reuse it later 'popular_product_items'
3-> we wrapped the 'Heart_Icon' with 'GetBuilder' widget, and we had accessed
to the controller properties inside 'myOnPressed' fct
N.B:When using GetBuilder make sure to:
..replace context with 'controller'
..specify the <class_name> next to GetBuilder  
 */