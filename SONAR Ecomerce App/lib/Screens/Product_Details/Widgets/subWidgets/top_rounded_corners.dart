import 'package:flutter/material.dart';

class TopRoundedCorners extends StatelessWidget {
  final Widget child;
  final Color? color;
  const TopRoundedCorners({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: child, //don't forget to call ur param, undless u'll see nothing
    );
  }
}
