// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_test/Screens/Home/widgets/popular_product.dart';
import 'package:flutter_application_test/Screens/Product_Details/Widgets/subWidgets/expanded_text.dart';
import 'package:flutter_application_test/Screens/Product_Details/Widgets/subWidgets/top_rounded_corners.dart';
import 'package:flutter_application_test/controllers/expanded_text_controller.dart';
import 'package:flutter_application_test/controllers/product_controller.dart';
import 'package:flutter_application_test/models/popular_product_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'subWidgets/add_to_card.dart';
import 'subWidgets/product_color_quant_custim.dart';

class ProductDetailsBody extends StatelessWidget {
  final PopularProductModel product;
   const ProductDetailsBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    ExpandedTextController textController = Get.find<ExpandedTextController>();
    
    return TopRoundedCorners(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .end, //to place the favory container to the right corner
          children: [
            Container(
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                product.productTitle,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: (){
                productController.toggleFavorite(product);
              },
              child: GetBuilder<ProductController>(
                builder: (controller) {
                  return Container(
                    width: 60,
                    height: 50,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? Colors.red.withOpacity(.25)
                          : Colors.grey.withOpacity(.3),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(17),
                        bottomLeft: Radius.circular(17),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: product.isFavourite ? Colors.red : Colors.grey,
                    ),
                  );
                }
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              //width: double.maxFinite,
              //height: 80,
              //margin: const EdgeInsets.only(right: 60),
              padding: const EdgeInsets.only(left: 20),
              //alignment: Alignment.centerLeft,
              //decoration: BoxDecoration(color: Colors.black),
              child: InkWell(
                onTap: () {
                  textController.isExpanded = !textController.isExpanded;
                },
                child: ExpandedText(text: product.description)),

            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: (){
                  textController.isExpanded = !textController.isExpanded;
                },
                child: Row(
                  children: [
                    GetBuilder<ExpandedTextController>(
                      builder: (controller) {
                        return Text(
                          'See ${controller.isExpanded && controller.isExpandable? 'Less' : 'More'} Detail',
                          style: const TextStyle(
                              color: Color(0xFFF6625E),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        );
                      }
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Color(0xFFF6625E),
                    ),
                  ],
                ),
              ),
            ),
            TopRoundedCorners(
              color: const Color(0xFFF5F6F9),
              child: Column(
                children: [
                  ProductColorCustimisation(product: product),
                  const SizedBox(height: 10),
                  Add_to_card(myProduct: product),
                ],
              ),
            ),
            //const SizedBox(width: 50),
          ],
        ),
      ),
    );
  }
}

/*
code explanation-Line 45-
GetBuilder: This is a widget from the GetX package. 
It listens to changes in the ProductController and rebuilds the UI when updates occur.
builder: This callback provides the controller which is an instance of ProductController. 
The UI returned here will be rebuilt whenever the ProductController calls update().
 */



