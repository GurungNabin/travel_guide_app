import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_guide_app/screen/home_screen.dart';
import 'package:travel_guide_app/utils.dart';

String uri = "https://www.consultancynepal.com/api";

class AuthService {
  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/login.php'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (res.statusCode == 200) {
        showSnackBar(context, 'Login Successfully');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (res.statusCode == 400) {
        showSnackBar(context, jsonDecode(res.body)['msg']);
      } else {
        showSnackBar(context, "Failed to login");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signup({
    required String name,
    required String password,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      print('Hit here');
      http.Response res = await http.post(Uri.parse('$uri/register.php'),
          body: jsonEncode({
            'username': name,
            'password': password,
            'email': email,
            'phonenumber': phone
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print('The status code is ${res.statusCode}');
      if (res.statusCode == 200) {
        Navigator.pop(context);
        showSnackBar(context, 'Successfully singup');
      } else if (res.statusCode == 400) {
        showSnackBar(context, jsonDecode(res.body)['msg']);
      } else {
        showSnackBar(context, "Failed to login");
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
