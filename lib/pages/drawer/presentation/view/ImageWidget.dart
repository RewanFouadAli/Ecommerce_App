import 'package:flowers_app/pages/drawer/presentation/viewmodel/cubit/drawercubit.dart';
import 'package:flowers_app/pages/drawer/presentation/viewmodel/cubit/drawerstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return CircularProgressIndicator(); // Show loading indicator while picking image
        } else if (state is SuccessState) {
          return Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(state.image), // Show loaded image
              ),
              Positioned(
                bottom: -10,
                right: 30,
                child: IconButton(
                  onPressed: () {
                    context.read<ImageCubit>().pickImage(ImageSource.gallery);
                  },
                  icon: Icon(Icons.add_a_photo),
                ),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Text(state.message); // Show error message if there's an error
        } else {
          return Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKfj6RsyRZqO4nnWkPFrYMmgrzDmyG31pFQ&s", // Default image
                ),
              ),
              Positioned(
                bottom: -10,
                right: 30,
                child: IconButton(
                  onPressed: () {
                    context.read<ImageCubit>().pickImage(ImageSource.gallery);
                  },
                  icon: Icon(Icons.add_a_photo),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
