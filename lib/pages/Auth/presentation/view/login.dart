import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowers_app/pages/Auth/presentation/view/register.dart';
import 'package:flowers_app/pages/Auth/presentation/view/widget/custom_textfield.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signin_cubit/signin_state.dart';
import 'package:flowers_app/pages/Home/presentation/view/home.dart';
import 'package:flowers_app/shared/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailAddress = TextEditingController();
    TextEditingController password = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: BlocListener<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SuccesState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(33),
            child: Column(
              children: [
                const SizedBox(height: 64),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        formstate: formKey,
                        text: "Email is empty",
                        namecontroller: emailAddress,
                        hinttext: "Enter Your Email",
                        ispassword: false,
                        textinputtype: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 33),
                      MyTextField(
                        formstate: formKey,
                        text: "Password is empty",
                        namecontroller: password,
                        hinttext: "Enter Your Password",
                        ispassword: true,
                        textinputtype: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 33),
                BlocBuilder<SigninCubit, SigninState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          context.read<SigninCubit>().signin(
                                emailAddress.text.trim(),
                                password.text.trim(),
                              );
                        }
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(BTNgreen),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(12),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 33),
                RichText(
                  text: TextSpan(
                    text: 'Do not have an account?',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign Up',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Register(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
