import 'package:flowers_app/checkout/checkout.dart';
import 'package:flowers_app/pages/Auth/presentation/view/login.dart';
import 'package:flowers_app/pages/Home/presentation/view/widgets/Homewidget.dart';
import 'package:flowers_app/pages/drawer/presentation/view/ImageWidget.dart';
import 'package:flowers_app/pages/drawer/presentation/viewmodel/cubit/drawercubit.dart';
import 'package:flowers_app/pages/drawer/presentation/viewmodel/cubit/drawerstate.dart';
import 'package:flowers_app/shared/appbarwidget.dart';
import 'package:flowers_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit(),
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ImageWidget(),
                  ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("My products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CheckOut()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: appbarGreen,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Home",
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
        body: HomeWidget(),
      ),
    );
  }
}
