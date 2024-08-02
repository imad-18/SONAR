import 'package:flutter/material.dart';
bool isChecked= false;

class StatefullCheckbox extends StatefulWidget {
  const StatefullCheckbox({super.key});

  @override
  State<StatefullCheckbox> createState() => _StatefullCheckboxState();
}

class _StatefullCheckboxState extends State<StatefullCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: changeCheckboxState,
    );
  }

  void changeCheckboxState(bool? value) {
  print('changeCheckboxState: $value');
  isChecked = value!;
  setState(() {    
  });
  }
  
}