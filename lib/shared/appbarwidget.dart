import 'package:flowers_app/checkout/checkout.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homecubit.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                int num = 0;
                if (state is AddState) {
                  num = state.num;
                }
                return Positioned(
                  bottom: 15,
                  child: Container(
                    child: Text(
                      "$num",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(211, 164, 255, 193),
                        shape: BoxShape.circle),
                  ),
                );
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOut()),
                );
              },
              icon: Icon(
                Icons.add_shopping_cart,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            double totalPrice = context.read<HomeCubit>().totalPrice;
            return Text(
              "\$ ${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ],
    );
  }
}
