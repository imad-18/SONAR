import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomIconButton extends StatelessWidget {
  final String iconPath;
  const CustomIconButton({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    bool cartIcon = true;
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: Colors.grey[200],
      ),
      child: IconButton(
        onPressed: () {
          if(cartIcon);
          Navigator.pushNamed(context, '/cart_screen');
        },
        icon: SvgPicture.asset(iconPath),
      ),
    );
  }
}