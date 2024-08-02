import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cashback extends StatelessWidget {
  const Cashback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      padding: EdgeInsets.only(left: 20),
      width: double.maxFinite,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xff4a3298),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('A Summer Surprise',style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 10),),
          SizedBox(height: 6),
          Text('Cashback 20%',style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
