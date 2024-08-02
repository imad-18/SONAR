import 'package:flutter/material.dart';
import 'package:flutter_application_test/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../../../../models/popular_product_model.dart';
import '../../../Product_Details/product_details_screen.dart';
import 'heart_icons.dart';

class PopularProductItems extends StatelessWidget {
  final PopularProductModel myProducts;

  const PopularProductItems({
    super.key,
    required this.myProducts,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color.fromARGB(255, 233, 231, 231),
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/productDetailsOriginal',
          arguments: ProductDetailsScreenArguments(myProducts),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              //details of the grey container wich includes the product
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: SizedBox(
                      width:
                          100, //details of the the image inside the grey container
                      height: 100,
                      child: Hero(
                        tag: myProducts.id,
                        child: Image.asset(myProducts.imagePath[0])),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 155,
              child: Text(
                myProducts.productTitle,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black.withOpacity(.75),
                ),
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${myProducts.productPrice.toString()}',
                  //textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                GetBuilder<ProductController>(
                  builder: (controller) {
                    return Heart_Icon(
                      isFavouritee: myProducts.isFavourite,
                      myOnPressed:(){
                        controller.toggleFavorite(myProducts);
                      } ,
                    );
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
