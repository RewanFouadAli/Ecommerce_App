import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: 26,
      color: Color.fromARGB(255, 255, 191, 0),
    );
  }
}
