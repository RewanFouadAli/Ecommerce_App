import 'package:flowers_app/pages/Auth/presentation/view/login.dart';
import 'package:flowers_app/pages/Auth/presentation/view/register.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signup_cubit/SignUp_Cubit.dart';
import 'package:flowers_app/pages/Home/presentation/view/home.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homecubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<SigninCubit>(
          create: (context) => SigninCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        home: LogIn(),
      ),
    );
  }
}
