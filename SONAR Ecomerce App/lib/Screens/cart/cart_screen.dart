import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_test/controllers/product_controller.dart';
import 'package:flutter_application_test/models/cart_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/cart_card.dart';
import 'widgets/cart_item_list.dart';
import 'widgets/checkout.dart';

class CartScreen extends StatelessWidget {
  //static String routeName = "/cart";
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductController myProductController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[300],
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(
                //fontSize: 20,
                color: Colors.black,
                // fontWeight: FontWeight.w400
              ),
            ),
            GetBuilder<ProductController>(builder: (controller) {
              return Text(
                '${cartItems.length} items',
                style: TextStyle(color: Colors.grey[900], fontSize: 16),
              );
            }),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 22,
            color: Colors.grey[900],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: ListView.builder(
          // Ensure itemCount is set correctly; it took me a day to realise the i forgot it
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 20),
              child: Dismissible(
                  key: Key(
                    cartItems[index].product.id.toString(),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    if (index < cartItems.length) {
                      myProductController.removeFromCart(cartItems[index]);
                
                    }
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  //  child: AddItemList(cart: cartItems[index]));
                  child: CartCard(cart: cartItems[index])),
            );
          },
        ),
      ),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
