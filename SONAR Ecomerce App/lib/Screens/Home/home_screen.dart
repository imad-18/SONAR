import 'package:flutter/material.dart';
import 'package:flutter_application_test/Screens/Home/widgets/custom_app_bar.dart';
import 'package:flutter_application_test/Screens/Home/widgets/custom_nav_bar.dart';
import 'package:flutter_application_test/enums/menu_state.dart';

import 'widgets/Cathegories.dart';
import 'widgets/custom_cashback.dart';
import 'widgets/popular_product.dart';
import 'widgets/special_offers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              Cashback(),
              Cathegories(),
              SizedBox(height: 20),
              SpecialOffers(),
              SizedBox(height: 20),
              PopularProducts(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButtomNavBar(selectedMenu: MenuState.home),
    );
  }
}
