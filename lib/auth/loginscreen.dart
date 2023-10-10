//Login email and password
//ram12@gmail.com
//12345

import 'package:flutter/material.dart';
import 'package:travel_guide_app/auth/auth_service.dart';
import 'package:travel_guide_app/auth/signup.dart';
import 'package:travel_guide_app/widget/utils.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void login() {
    authService.login(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Center(
                child: Image(
                  image: AssetImage('assets/images/Logo.png'),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  if (emailController.text == '') {
                    showSnackBar(context, 'Please enter your email');
                  } else if (passwordController.text == '') {
                    showSnackBar(context, 'Please enter your password');
                  } else if (passwordController.text.length < 5) {
                    showSnackBar(context, 'Please enter your strong');
                  } else {
                    login();
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
                width: double.infinity,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text('Go to singup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
