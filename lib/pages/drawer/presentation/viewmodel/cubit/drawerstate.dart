import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

abstract class ImageState {}

class InitialState extends ImageState {}

class LoadingState extends ImageState {}

class SuccessState extends ImageState {
  final Uint8List image;
  SuccessState(this.image);
}

class ErrorState extends ImageState {
  final String message;
  ErrorState(this.message);
}
