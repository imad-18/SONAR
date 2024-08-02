import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'Sub_Widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            //to let the container takes the row lefted place after adding other elements
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search product',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CustomIconButton(iconPath: 'assets/icons/Cart Icon.svg'),
          const SizedBox(width: 10),
          const CustomIconButton(iconPath: 'assets/icons/Bell.svg'),
        ],
      ),
    );
  }
}
