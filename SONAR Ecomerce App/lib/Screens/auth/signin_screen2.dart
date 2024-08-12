import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signin2 extends StatelessWidget {
  const Signin2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'bitterr',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'bitterr',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  'Sign in with your email and password  \nor continue with social media',
                  style: TextStyle(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  
                  decoration: InputDecoration(
                    labelText: 'email',
                    hintText: 'Enter your email',
                    suffixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: const Icon(Icons.lock_outline_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: changeCheckboxState2,
                        ),
                        Text('Remember me'),
                      ],
                    ),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                TextButton(
                  onPressed: lalao,
                  child: const Text('Continue'),
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xfff77546),
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 115, vertical: 20)),
                ),
                const SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment
                          .center, //to control icon sizing-width&height-
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.cyan[50]),
                      child: SvgPicture.asset(
                        'assets/icons/google_svg.svg',
                        width: 25,
                        height: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.cyan[50]),
                      child: SvgPicture.asset(
                        'assets/icons/fb_svg.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.cyan[50]),
                      child: SvgPicture.asset(
                        'assets/icons/twitter_svg.svg',
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xfff77546),
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void lalao() {
  print('salam');
}
void changeCheckboxState2(bool? value){
  print('hi');
}
