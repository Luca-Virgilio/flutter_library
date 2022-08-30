import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  Color color;
  String? validatorName;
  Function? validatorFun;
  TextInputType? inputType;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.validatorFun,
      this.inputType,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: TextStyle(color: color),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: color),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      validator: (value) => validatorFun != null ? validatorFun!(value) : null,
    );
  }
}
