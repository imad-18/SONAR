import 'package:flutter/material.dart';
import 'package:flutter_application_test/Screens/Home/home_screen.dart';
import 'package:flutter_application_test/Screens/cart/cart_screen.dart';
import 'package:flutter_application_test/controllers/expanded_text_controller.dart';
import 'package:flutter_application_test/controllers/product_controller.dart';
import 'package:get/get.dart';
/*import 'package:flutter_application_test/Screens/signin_screen.dart';*/
//import 'package:flutter_svg/flutter_svg.dart';

import 'Screens/Product_Details/product_details_screen.dart';
import 'Screens/auth/signin_screen.dart';
//import 'Screens/auth/signin_screen2.dart';

import 'Screens/auth/signup_screen.dart';
import 'Screens/onboarding/onboarding.dart';
import 'Screens/profile/profile_screen.dart';
// import 'Screens/onboarding/onboarding_screen.dart';
// import 'Screens/onboarding/onboarding_screen2.dart';


void main() {
  Get.lazyPut(() => ProductController(), fenix: true);
  Get.lazyPut(()=>ExpandedTextController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      //home: const SigninScreen(),
      initialRoute: '/home', //default screen
      routes:{
        '/signin': (context) => const SigninScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/productDetailsOriginal': (context) => const ProductDetailsScreen(),
        '/profile' : (context) => ProfileScreen(),
        '/onb_scr' : (context) => OnboardingScreen(),
        '/cart_screen' : (context) => CartScreen(),
        
      },
    );
  }
}
