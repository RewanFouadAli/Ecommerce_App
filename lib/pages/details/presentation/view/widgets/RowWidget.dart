import 'package:flowers_app/pages/details/presentation/view/widgets/IconWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Text(
            "New",
            style: TextStyle(fontSize: 15),
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 129, 129),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 10),
        IconWidget(),
        IconWidget(),
        IconWidget(),
        IconWidget(),
        IconWidget(),
        SizedBox(width: 40),
        Icon(
          Icons.edit_location,
          size: 26,
          color: Color.fromARGB(168, 3, 65, 27),
        ),
        SizedBox(width: 3),
        Text(
          "Flower Shop",
          style: TextStyle(fontSize: 19),
        ),
      ],
    );
  }
}
