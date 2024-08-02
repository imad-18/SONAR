import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class cathegoryItems extends StatelessWidget {
  final String iconPath, title;
  const cathegoryItems({
    super.key, 
    required this.iconPath, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffFFECDF),
          ),
          child: SvgPicture.asset(iconPath),
        ),
        SizedBox(
          width: 50,
          child: Text(
            title,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
