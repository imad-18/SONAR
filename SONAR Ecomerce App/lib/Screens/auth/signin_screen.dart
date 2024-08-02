import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Widgets/stateful_checkbox.dart'; //External homemade widget
import 'Widgets/stateful_pass_visibility.dart'; //External homemade widget

var formKey = GlobalKey<FormState>();
String emailInput = '', passInput = '';
bool isChecked = false;

//Password eye icon
bool isVisible = false;

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Welcome Back ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: "bitterr",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Sign in with your email and password  \nor continue with social media',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.3, //height between lines of text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onSaved: (String? newValue) {
                      emailInput = newValue!;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      } else if (value.length < 5) {
                        return "Length must be > 5";
                      } else if (!value.contains("@")) {
                        return "Email must contain @";
                      } else if (!value.contains(".")) {
                        return "Email must contain .";
                      }
                      return null; // Everything is fine
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      suffixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //TextFormField
                  const StatefullPassVisibility(),

                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          StatefullCheckbox(),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Forgot password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, //content color
                      backgroundColor: const Color.fromARGB(255, 255, 115, 0), //bg color
                      padding: const EdgeInsets.symmetric(
                        //padding width & height
                        vertical: 20,
                        horizontal: 115,
                      ),
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), //applied by default
                    ),
                    onPressed: () => signIn(context),
                    child: const Text('Continue'),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //to center those elements
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: Image.asset('assets/icons/fb.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        //padding: EdgeInsets.all(5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/icons/google_svg.svg',
                          width: 25, //use those param to control img size (B.P)
                          height: 25, //or padding: ... above
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: Image.asset('assets/icons/twitter.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

void signIn(context) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    print(emailInput);
    print(passInput);
    print(isChecked);

    Navigator.pushNamed(context,
        '/home'); //to navigate to home screen when clicking to the button
  }
}
