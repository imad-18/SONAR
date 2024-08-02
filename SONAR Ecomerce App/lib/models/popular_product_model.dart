import 'package:flutter/material.dart';

class PopularProductModel {
  final int id;
  final String productTitle, description;
  final List<String> imagePath;
  final List<Color> colors;
  final double productPrice;
  final double rating;
  bool isFavourite, isPopular;

  PopularProductModel({
    required this.id,
    required this.productTitle,
    required this.description,
    required this.productPrice,
    required this.imagePath,
    required this.colors,
    this.rating = 23,
    this.isFavourite = false,
    this.isPopular = false,
  });
}

List<PopularProductModel> PopularProductList = [
  PopularProductModel(
    id: 1,
    imagePath: [
      'assets/images/ps4_console_white_1.png',
      'assets/images/ps4_console_white_2.png',
      'assets/images/ps4_console_white_3.png',
      'assets/images/ps4_console_white_4.png',
    ],
    colors: [
      Colors.purple,
      Colors.black12,
      Color(0xFFF6625E),
      Colors.white,
    ],
    productTitle: 'Wireless Controller for PS4',
    productPrice: 64.99,
    isFavourite: false,
    description: 'Description for the 1st popular product Description for the 1st popular productDescription for the 1st popular productDescription for the 1st popular product my name is imad and my school name is ENsaK ',
  
  ),
  PopularProductModel(
    id: 2,
    imagePath: [
      'assets/images/Image Popular Product 2.png',
      'assets/images/ps4_console_white_4.png',
    ],
    colors: [
      Colors.purple,
      Colors.black12,
      Color(0xFFF6625E),
      Colors.white,
    ],
    productTitle: 'Nike Sport White - Man Pants',
    productPrice: 50.50,
    isFavourite: true,
    description: 'Description for the 2nd popular product',
  ),
  PopularProductModel(
    id: 3,
    imagePath: ["assets/images/glap.png"],
    colors: [
      Colors.purple,
      Colors.black12,
      Color(0xFFF6625E),
      Colors.white,
    ],
    productTitle: "Outdoor Sports Bike Black Gloves",
    productPrice: 15.49,
    isFavourite: false,
    description: 'Description for the 3th popular product',
  ),
  PopularProductModel(
    id: 4,
    imagePath: ["assets/images/wireless headset.png"],
    colors: [
      Colors.purple,
      Colors.black12,
      Color(0xFFF6625E),
      Colors.white,
    ],
    productTitle: "Sony Headphones",
    productPrice: 15.49,
    isFavourite: false,
    description: 'Description for the 4th popular product',
  ),
  PopularProductModel(
    id: 5,
    imagePath: [
      "assets/images/spinner.png",
      "assets/images/spinner_2.png",
    ],
    colors: [
      Colors.blue,
      Colors.black12,
      Colors.yellow,
    ],
    productTitle: "Fidget Spinner'18",
    productPrice: 3.99,
    isFavourite: true,
    description: 'Description for the 5th popular product',
  ),
];
