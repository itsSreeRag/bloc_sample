import 'package:bloc_sample/constants/constants.dart';
import 'package:bloc_sample/controller/login_bloc/login_bloc.dart';
import 'package:bloc_sample/views/navigationbar/navigationbar.dart';
import 'package:bloc_sample/widgets/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:bloc_sample/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController userNamecontroller = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Login successful!',
                  style: TextStyle(color: AppColors.white),
                ),
                duration: Duration(seconds: 2),
                backgroundColor: AppColors.green,
              ),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyNavigationbar()),
            );
          }
        },
        child: DismissKeyboard(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      const Text(
                        'Let\'s Sign You In ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Welcome back, you\'ve been missed!',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 70),
                      Text(
                        'Username(emilys)',
                        style: TextStyle(color: AppColors.brown),
                      ),
                      MyTextFormField(
                        controllers: userNamecontroller,
                        hintText: 'Username',
                        prefixIconData: Icons.person_2_outlined,
                      ),
                      const SizedBox(height: 60),
                      const Text(
                        'Password(emilyspass)',
                        style: TextStyle(color: AppColors.brown),
                      ),
                      MyTextFormField(
                        controllers: passwordController,
                        hintText: 'Password',
                        prefixIconData: Icons.lock_outlined,
                      ),
                      const SizedBox(height: 100),
                      SizedBox(
                        height: 50,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkBrown,
                              foregroundColor: AppColors.cream,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                  LogInButtonPressed(
                                    userName: userNamecontroller.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
