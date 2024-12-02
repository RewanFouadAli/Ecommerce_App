import 'package:flowers_app/model/item.dart';
import 'package:flowers_app/pages/details/presentation/view/widgets/RowWidget.dart';
import 'package:flowers_app/shared/appbarwidget.dart';
import 'package:flowers_app/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final Itmes item;

  DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: appbarGreen,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AppBarWidget(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.item.imagePath),
            SizedBox(height: 10),
            Text("\$${widget.item.price.toString()}"),
            SizedBox(height: 15),
            RowWidget(),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Details : ",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants...",
              style: TextStyle(
                fontSize: 18,
              ),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
