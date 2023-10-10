import 'package:flutter/material.dart';
import 'package:travel_guide_app/auth/auth_service.dart';
import 'package:travel_guide_app/custom/custom_textfiled.dart';
import 'package:travel_guide_app/widget/utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final AuthService authService = AuthService();

  void signup({required BuildContext context}) {
    authService.signup(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text,
        phone: phoneController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('SignUp'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextField(controller: nameController, hintText: 'name'),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                  controller: passwordController, hintText: 'password'),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(controller: emailController, hintText: 'email'),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(controller: phoneController, hintText: 'phone'),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (nameController.text == '' &&
                        passwordController.text == '' &&
                        emailController.text == '' &&
                        phoneController.text == '') {
                      showSnackBar(
                          context, 'Please enter all the required field');
                    } else if (passwordController.text.length < 5) {
                      showSnackBar(context, 'Please enter a longer password');
                    } else {
                      signup(context: context);
                    }
                  },
                  child: const Text('SignUp')),
            ],
          ),
        ),
      ),
    );
  }
}
