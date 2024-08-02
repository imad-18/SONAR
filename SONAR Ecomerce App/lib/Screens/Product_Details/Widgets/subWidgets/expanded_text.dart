import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/expanded_text_controller.dart';

class ExpandedText extends StatelessWidget {
  const ExpandedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    ExpandedTextController controller = Get.find<ExpandedTextController>();

    String firstPart = "";
    String secondPart = "";

    if (text.length > 160) {
      firstPart = text.substring(0, 160);
      secondPart = text.substring(160, text.length);
      controller.isExpandable = true; //possibility for to be expanded
      controller.isExpanded = false; //currently not exoanded
    } else {
      firstPart = text;
      secondPart = "";
      controller.isExpandable = false; // <160 chars -> cannot be expanded
      controller.isExpanded = false; 
    }

    return SizedBox(
      width: double.maxFinite,
      child: GetBuilder<ExpandedTextController>(builder: (controller) {
        return Text(
          controller.isExpanded
              ? (firstPart + secondPart)
              : (firstPart + (controller.isExpandable ? " ..." : "")),
          style: const TextStyle(
            color: Colors.grey,
            height: 1.8,
          ),
        );
      }),
    );
  }
}