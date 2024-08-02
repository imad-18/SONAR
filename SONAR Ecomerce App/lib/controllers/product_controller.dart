import 'package:flutter_application_test/models/cart_model.dart';
import 'package:flutter_application_test/models/popular_product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  int productQuantity = 1;
  int selectedColor = 0;

  void incrementX() {
    productQuantity++;
    update();
  }

  void decrementX() {
    if (productQuantity > 1) {
      productQuantity--;
      update();
    }
  }

  void toggleFavorite(PopularProductModel product) {
    product.isFavourite = !product.isFavourite;
    update();
  }

  //setting the productQuantity on 0 each time u click on a product
  void init() {
    productQuantity = 1;
  }

  void addToCart(PopularProductModel product) {
    bool isAlreadyIn = false;
    cartItems.forEach(
      (element) {
        if (element.product.id == product.id) {
          isAlreadyIn = true;
        }
      },
    );
    if (productQuantity > 0 && !isAlreadyIn) {
      cartItems.add(CartModel(product: product, numOfItem: productQuantity));
      Get.back();
    }   
    //print('stocked succesfully'); 
  }

  void removeFromCart(CartModel cart) {
    cartItems.remove(cart);
    update();
  }

  String getTotalPrice() {
    double value = 0;
    for (CartModel element in cartItems) {
      value += element.product.productPrice * element.numOfItem;
    }
    return value.toStringAsFixed(2);
  }
}
