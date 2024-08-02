import 'package:flutter/material.dart';
import 'package:flutter_application_test/controllers/product_controller.dart';
import 'package:flutter_application_test/models/popular_product_model.dart';
import 'package:get/get.dart';

import 'top_rounded_corners.dart';

class Add_to_card extends StatelessWidget {
  final PopularProductModel myProduct;
  const Add_to_card({
    super.key,
    required this.myProduct,
  });

  @override
  Widget build(BuildContext context) {
    ProductController prodController = Get.find<ProductController>();
    return TopRoundedCorners(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 255, 115, 0),
            ),
            onPressed: () {
              prodController.addToCart(myProduct);
            },
            child: const Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
