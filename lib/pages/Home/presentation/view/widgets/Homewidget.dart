import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homecubit.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homestate.dart';
import 'package:flowers_app/pages/details/presentation/view/detailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowers_app/model/item.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 33,
            ),
            itemCount: Itmes.items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        item: Itmes.items[index],
                      ),
                    ),
                  );
                },
                child: GridTile(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      Itmes.items[index].imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: GridTileBar(
                    trailing: IconButton(
                      onPressed: () {
                        context.read<HomeCubit>().add(Itmes.items[index]);
                      },
                      color: Color.fromARGB(255, 62, 94, 70),
                      icon: Icon(Icons.add),
                    ),
                    leading: Text(
                      "\$${Itmes.items[index].price.toStringAsFixed(2)}",
                    ),
                    title: Text(""),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
