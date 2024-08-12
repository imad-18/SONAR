import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_test/controllers/auth_controller.dart';
import 'package:get/get.dart';

var formKey = GlobalKey<FormState>();
String emailInput = '', passInput = '', passInputConfirmtion = '';

  //final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  //final TextEditingController _confirmPass = TextEditingController();

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
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
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Text(
                        'Sign Up',
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
                    'Register Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontFamily: "bitterr",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Complete your details or continue \nwith social media',
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
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      suffixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onSaved: (String? newValue) {
                      emailInput = newValue!;
                    },
                    validator: (String? value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (!emailValid) {
                        return 'Email not valid';
                      }
                      ;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true, //to hide password
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password', //placeHolder
                      suffixIcon:
                          const Icon(Icons.lock_outline_rounded), //4 l9fal icon
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    //storing data
                    onSaved: (String? newValue) {
                      passInput = newValue!;
                    },
                    //input traitment
                    controller: _pass,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid password';
                      }else if(value.length < 8){
                        return 'length must be > 8';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      suffixIcon:
                          const Icon(Icons.lock_outline_rounded), //for l9fal icon
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    //storing data
                    onSaved: (String? newValue) {
                      passInputConfirmtion = newValue!;
                    },
                    //input traitment
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid password';
                      }else if(value.length < 8){
                        return 'length must be > 8';
                      }else if(value != _pass.text){
                        return 'Password does not match !!';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextButton(
                    onPressed: () => signUp(context, authController),
                    child: const Text('Continue'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, //content color
                      backgroundColor: const Color.fromARGB(255, 255, 115, 0), //bg color: 0xfff77546 : original
                      padding: const EdgeInsets.symmetric(
                        //padding width & height
                        vertical: 20,
                        horizontal: 115,
                      ),
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), //applied by default
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //to center those elements
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(
                            5), //1st method to fix size of the image inside the container
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
                        child: Image.asset(
                          'assets/icons/google.png',
                          cacheHeight: 25, //2nd method to handle image size
                          cacheWidth: 25,
                        ),
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
                        child: Container(
                          //3rd method: we put image & margin inside a container
                          child: Image.asset('assets/icons/twitter.png'),
                          margin: const EdgeInsets.all(5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'By continuing your confirm that you agree with our terms & coditions',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

void signUp(context, AuthController authController) {
  print('Salam');
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    print(emailInput);
    print(passInput);
    print(passInputConfirmtion);
    //call sign up APIa
    authController.signUp(emailInput, passInput);
    //if success
    //go to the home screen

    Navigator.pushNamed(context, '/home');
  }
}


