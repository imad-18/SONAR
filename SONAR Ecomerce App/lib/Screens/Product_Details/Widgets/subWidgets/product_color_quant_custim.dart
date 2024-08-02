import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/product_controller.dart';
import '../../../../models/popular_product_model.dart';

class ProductColorCustimisation extends StatelessWidget {
  const ProductColorCustimisation({
    super.key,
    required this.product,
  });

  final PopularProductModel product;

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    productController.init(); 

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            product.colors.length,
            (index) => GetBuilder<ProductController>(
              id: 'color',
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    controller.selectedColor = index;
                    controller.update(['color']);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xFFF6625E).withOpacity(
                            controller.selectedColor == index ? 1 : 0),
                      ),
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: product.colors[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //SizedBox(width: 40),
          const Spacer(),
          GestureDetector(
            onTap: () {
              productController.decrementX();
              //print(x);
            },
            child: Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.only(bottom: 16),
              //margin: const EdgeInsets.only(right: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: const Icon(
                Icons.minimize_rounded,
                size: 26,
              ),
            ),
          ),
          //SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: GetBuilder<ProductController>(
                //id: 'quantity', //
                builder: (controller) {
                  return Text(
                    controller.productQuantity.toString(),
                    //'$x', // Display the value of x
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              productController.incrementX();
              //print(x);
            },
            child: Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SvgPicture.asset('assets/icons/Plus Icon.svg'),
            ),
          ),
        ],
      ),
    );
  }
}

/*
N.B: if u declare an id without using in ur code, u'll have error, and ur
code won't work for u  
*/