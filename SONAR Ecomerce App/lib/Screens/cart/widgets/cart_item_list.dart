import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/cart_model.dart';

class AddItemList extends StatelessWidget {
  final CartModel cart;
  const AddItemList({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(cart.product.imagePath[0]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
