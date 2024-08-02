import 'package:flutter/material.dart';

//1st.. we declare a 'sec_Title' var inside the class & we add 'required this.sec_Title'
//2nd.. we put the var inside the text element
//3th.. we pass it in the 'special offers' widget as - SectionTitle(sec_Title: 'Special for you')-

class SectionTitle extends StatelessWidget {
  final String sec_Title;
  const SectionTitle({
    super.key, 
    required this.sec_Title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //we wrapped the row with the container to add margin/padding, also to extract it as a widget
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sec_Title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Text(
            'See More',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
