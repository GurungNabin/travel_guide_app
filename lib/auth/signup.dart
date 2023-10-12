import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_app/auth/auth_service.dart';
import 'package:travel_guide_app/custom/custom_textfiled.dart';
import 'package:travel_guide_app/utils.dart';
import 'package:travel_guide_app/firebase_options.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();

  late TextEditingController emailController = TextEditingController();

  late TextEditingController phoneController = TextEditingController();

  // final AuthService authService = AuthService();
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('SignUp'),
        ),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: nameController, hintText: 'name'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(hintText: 'password'),
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                          controller: emailController, hintText: 'email'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                          controller: phoneController, hintText: 'phone'),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            // if (nameController.text == '' &&
                            //     passwordController.text == '' &&
                            //     emailController.text == '' &&
                            //     phoneController.text == '') {
                            //   showSnackBar(
                            //       context, 'Please enter all the required field');
                            // } else if (passwordController.text.length < 5) {
                            //   showSnackBar(context, 'Please enter a longer password');
                            // } else {
                            //   signup(context: context);
                            // }

                            final name = nameController.text;
                            final password = passwordController.text;
                            final email = emailController.text;
                            final phone = phoneController.text;

                            try {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('weak password');
                              } else if (e.code == 'email-already-used') {
                                print('Email used');
                              } else if(e.code == 'invalid email'){
                                print('invalid email');
                              }
                            }
                          },
                          child: const Text('SignUp')),
                    ],
                  ),
                ),
              );
            default:
              return const Text('Loading..');
          }
        },
      ),
    );
  }
}
