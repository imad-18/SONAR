import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(35),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SONAR',
                      style: TextStyle(
                        color: Colors.orange[400],
                        fontFamily: 'bitterr',
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Welcome to ",
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SONAR',
                        style: TextStyle(
                          color: Color.fromARGB(247, 132, 130, 130),
                          fontFamily: 'bitterr',
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 59, 57, 57),
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      ),
                      TextSpan(
                        text: '. Let\'s shop',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/images/splash_1.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ), 
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.grey[300],
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.grey[300],
                    ),
                  ],
                ),               
                SizedBox(
                  height: 80,
                ),
                TextButton(
                  onPressed: printhi,
                  child: Text('Continue'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 115,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), //applied by default
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void printhi() {
  print('hi');
}
