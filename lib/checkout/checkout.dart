import 'package:flowers_app/model/item.dart';
import 'package:flowers_app/pages/Home/presentation/view/home.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homecubit.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homestate.dart';
import 'package:flowers_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOut extends StatelessWidget {
  CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        backgroundColor: appbarGreen,
        title: Text(
          "CheckOut",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 550,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            List<Itmes> selectedItems = context.read<HomeCubit>().selectedItems;

            if (selectedItems.isEmpty) {
              return Center(child: Text("data is not valid"));
            }

            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: selectedItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        selectedItems[index].imagePath,
                      ),
                    ),
                    title: Text("Item ${index + 1}"),
                    subtitle: Text(
                        "\$${selectedItems[index].price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      onPressed: () {
                        context
                            .read<HomeCubit>()
                            .removeItem(selectedItems[index]);
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
