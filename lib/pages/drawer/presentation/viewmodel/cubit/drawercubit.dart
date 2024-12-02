import 'dart:typed_data';
import 'package:flowers_app/pages/drawer/presentation/viewmodel/cubit/drawerstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(InitialState());

  Future<void> pickImage(ImageSource source) async {
    emit(LoadingState());

    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);

    if (_file != null) {
      Uint8List imageData = await _file.readAsBytes();
      emit(SuccessState(imageData));
    } else {
      emit(ErrorState("No image selected"));
    }
  }
}
