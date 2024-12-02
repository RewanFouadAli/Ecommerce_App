import 'package:flowers_app/pages/Auth/presentation/view/login.dart';
import 'package:flowers_app/pages/Auth/presentation/view/widget/custom_textfield.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signup_cubit/SignUp_Cubit.dart';
import 'package:flowers_app/pages/Auth/presentation/viewmodel/cubit/signup_cubit/SignUp_State.dart';
import 'package:flowers_app/pages/Home/presentation/view/home.dart';
import 'package:flowers_app/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController emailAddress = TextEditingController();
    TextEditingController password = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        body: BlocListener<AuthCubit, AuthState>(
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 64),
                    MyTextField(
                      formstate: formKey,
                      text: "Name is empty",
                      namecontroller: name,
                      hinttext: "Enter Your Username",
                      ispassword: false,
                      textinputtype: TextInputType.text,
                    ),
                    const SizedBox(height: 33),
                    MyTextField(
                      formstate: formKey,
                      text: "Email address is empty",
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
                    const SizedBox(height: 33),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('Email: ${emailAddress.text.trim()}');
                              print('Password: ${password.text.trim()}');
                              context.read<AuthCubit>().signUp(
                                    emailAddress.text.trim(),
                                    password.text.trim(),
                                  );
                            }
                          },
                          child: state is LoadingState
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(BTNgreen),
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
                        text: 'Already have an account?',
                        style: const TextStyle(
                            color: Color(0xff000000), fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sign In',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LogIn()),
                                );
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
