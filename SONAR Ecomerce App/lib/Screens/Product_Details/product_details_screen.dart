import 'package:flutter/material.dart';

import '../../models/popular_product_model.dart';
import 'Widgets/product_details_body.dart';
import 'Widgets/product_details_header.dart';
import 'Widgets/product_images.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ProductDetailsScreenArguments;

    PopularProductModel product = args.produit;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      body: ListView(
        children: [
          const ProductDetailsHeader(
            rating: '23',
          ),
          //const SizedBox(height: 20),
          ProductImages(imagePath: product.imagePath, id: product.id,),
          //Text('title: ${product.productTitle}'),
          const SizedBox(height: 30),
          ProductDetailsBody(product: product),
           //ProductCustomisation(),
          // AddToCartButton(),
        ],
      ),
    );
  }
}

class ProductDetailsScreenArguments {
  final PopularProductModel produit;

  ProductDetailsScreenArguments(this.produit);
}

/*
------Product_Details_Screen-------------
1-We define a 'ProductDetailsScreenArguments' class that has our infos -just above-

2-we put this code given by the flutter official website:
    final args = ModalRoute.of(context)!.settings.arguments
        as ProductDetailsScreenArguments;

    PopularProductModel product = args.product;

------Home_Screen------------------------
3-we put this code in the 'PopularProductItems' widget of 'home' screen:
      onTap: () {
        Navigator.pushNamed(
          context,
          '/productDetailsOriginal',
          arguments: ProductDetailsScreenArguments(myProducts),
        );
      },
-We pass into the 'argument' section all the infos that we want to reuse when clicking on a certain product.
-
*/ 