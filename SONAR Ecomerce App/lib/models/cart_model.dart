import 'package:flutter_application_test/models/popular_product_model.dart';

class CartModel {
  final PopularProductModel product;
  final int numOfItem;

  CartModel({
    required this.product,
    required this.numOfItem,
  });
}

List<CartModel> cartItems = [];
