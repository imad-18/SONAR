import 'package:flutter/material.dart';

bool isVisible = false;
String passInput = "";
class StatefullPassVisibility extends StatefulWidget {
  const StatefullPassVisibility({super.key});

  @override
  State<StatefullPassVisibility> createState() =>
      _StatefullPassVisibilityState();
}

class _StatefullPassVisibilityState extends State<StatefullPassVisibility> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //obscureText: isVisible, //to hide password
      onSaved: (String? newValue) {
        passInput = newValue!;
        debugPrint('pass saved succ: $passInput');
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Please enter yout Password";
        } else if (value.length < 8) {
          return "length must be > 8";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        labelText: 'Password',
        hintText: 'Enter your password', //placeHolder
        suffixIcon: IconButton(
            onPressed: () {
              isVisible = !isVisible;
              setState(() {

              });
            },
            icon: Icon(isVisible? Icons.visibility_outlined:Icons.visibility_off_outlined)), //4 l9fal icon
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

}