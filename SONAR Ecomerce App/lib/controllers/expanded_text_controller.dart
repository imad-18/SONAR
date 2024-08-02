import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExpandedTextController extends GetxController {
  bool _isExpanded = false;
  bool _isExpandable = false;

  bool get isExpanded => _isExpanded;
  set isExpanded(bool value) {
    _isExpanded = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  bool get isExpandable => _isExpandable;
  set isExpandable(bool value) {
    _isExpandable = value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }
}

/*
=============How to handle 'See More/Less Detail >' ==============27-07-2024, 2:06
1-- 1st file has the 'ExpandedText' widget that has the logical handling
of the text that will showed on the screen 
2-- 2nd file(this one) hass the 'ExpandedTextController' class that has the 
traitment of GetX package to update the content inside the 'GetBuilder' 
with this class name
3-- we head to 'ProductDetailsBody' global widget
we wrap the 'See more Detail' text with 'GetBuilder' & <controller_class_name>
we wrap the container that has the product description with the 
'inkWell' widget , also the 'See more Detail' and add that logical line
thus, while ontaping, the state of the description will change correspandly

N.B: 
Don't forget to add this to charge the controller clas into the memory by: 
  Get.lazyPut(()=>ExpandedTextController());
also this line in the 'ExpandedText' to initialize the controler
  ExpandedTextController controller = Get.find<ExpandedTextController>();

This line registers the 'ExpandedTextController' with GetX's dependency 
injection system, just like the 'ProductController'. 
It ensures that an instance of 'ExpandedTextController' is created only 
when it's first needed.
 */