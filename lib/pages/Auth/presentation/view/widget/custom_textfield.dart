import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  bool ispassword;
  String hinttext;
  String text;
  TextInputType textinputtype;
  TextEditingController namecontroller;
  final GlobalKey<FormState> formstate;
  MyTextField(
      {Key? key,
      required this.hinttext,
      required this.ispassword,
      required this.textinputtype,
      required this.namecontroller,
      required this.formstate,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return text;
        }
      },
      controller: namecontroller,
      obscureText: ispassword,
      keyboardType: textinputtype,
      decoration: InputDecoration(
        hintText: hinttext,
        enabledBorder:
            OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
    );
  }
}
