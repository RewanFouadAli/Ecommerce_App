import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers_app/pages/Auth/presentation/view/controler.dart';
import 'package:flowers_app/pages/Auth/presentation/view/login.dart';
import 'package:flowers_app/pages/Auth/presentation/view/widget/custom_textfield.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signup_cubit/SignUp_Cubit.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signup_cubit/SignUp_State.dart';
import 'package:flowers_app/shared/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialState());

  void signUp(String email, String password) async {
    try {
      emit(LoadingState());

      final credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SuccesState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorState("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorState("The account already exists for that email."));
      } else {
        emit(ErrorState("An error occurred: ${e.message}"));
      }
    } catch (e) {
      emit(ErrorState("An error occurred: $e"));
    }
  }
}
