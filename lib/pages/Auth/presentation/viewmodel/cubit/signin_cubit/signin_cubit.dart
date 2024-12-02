import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signin_cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(InitialState());
  void signin(String email, String password) async {
    try {
      emit(LoadingState());
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccesState());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ErrorState("No user found for that email."));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('No user found for that email.'),
        //   ),
        // );
      } else if (e.code == 'wrong-password') {
        emit(ErrorState("Wrong password provided."));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Wrong password provided.'),
        //   ),
        // );
      }
    }
  }
}
