import 'package:flutter/widgets.dart';

class Itmes {
  String imagePath;
  double price;

  Itmes({
    this.imagePath = '',
    this.price = 0,
  });

  static List<Itmes> items = [
    Itmes(imagePath: "assets/images/1.jpg", price: 12.99),
    Itmes(imagePath: "assets/images/2.jpg", price: 400),
    Itmes(imagePath: "assets/images/3.jpg", price: 365.99),
    Itmes(imagePath: "assets/images/4.jpg", price: 275.99),
    Itmes(imagePath: "assets/images/5.jpg", price: 180.99),
    Itmes(imagePath: "assets/images/6.jpg", price: 500),
    Itmes(imagePath: "assets/images/7.jpg", price: 456),
    Itmes(imagePath: "assets/images/8.jpg", price: 478),
  ];
}
