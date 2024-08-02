import 'package:flutter/material.dart';

import 'Sub_Widgets/cathegory_Items.dart';

class Cathegories extends StatelessWidget {
  const Cathegories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> Cathegories = [
      {'iconPath': 'assets/icons/Flash Icon.svg', 'title': 'Flasdsh Deal'},
      {'iconPath': 'assets/icons/Bill Icon.svg', 'title': 'Bill'},
      {'iconPath': 'assets/icons/Game Icon.svg', 'title': 'Game'},
      {'iconPath': 'assets/icons/Gift Icon.svg', 'title': 'Daily Gift'},
      {'iconPath': 'assets/icons/Discover.svg', 'title': 'More'},
    ];
    return Container(
      width: double.maxFinite,
      //height: 150, //it'll be difined automatically
      margin: EdgeInsets.all(10),
      //color: Colors.orange.withOpacity(.6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          Cathegories.length,
          (index) => cathegoryItems(
              iconPath: Cathegories[index]['iconPath']!,
              title: Cathegories[index]['title']!),
        ),
      ),
    );
  }
}
