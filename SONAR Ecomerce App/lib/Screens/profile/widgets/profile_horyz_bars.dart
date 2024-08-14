import 'package:flutter/material.dart';
import 'package:flutter_application_test/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProfilaBars extends StatelessWidget {
  final String bareType;
  final IconData myIcon;
  const ProfilaBars({
    super.key,
    required this.bareType,
    required this.myIcon,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    return TextButton(
      onPressed: () {
        //That's how we can handle rounting/Navigation
        if (bareType == 'Log Out')
          // Navigator.pushNamedAndRemoveUntil(
          //     context, '/signup', (Route<dynamic> route) => false);
        
        authController.logOut(context);
        // Navigator.popUntil(context, ModalRoute.withName('/signin'));
        // if(bareType =='My Account')
        // Navigator.popAndPushNamed(context, '/signin');
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black.withOpacity(.4),
        backgroundColor: Colors.grey.withOpacity(.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        // side: BorderSide(
        //   color: const Color.fromARGB(255, 255, 111, 0),
        //   width: 1.2,
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                myIcon, //I got an error here before. I had to use 'IconData' instead on 'Icon'
                size: 24,
                color: Color.fromARGB(255, 255, 115, 0),
              ),
              SizedBox(width: 8),
              Text(
                '${bareType}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
          ),
        ],
      ),
    );
  }
}
