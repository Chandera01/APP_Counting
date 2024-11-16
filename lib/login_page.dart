import 'package:counter_sharedpref/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget{

  static const LOGIN_KEY = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(LOGIN_KEY, true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage(),));
        } , child: Text("Login")),
      ),
    );
  }
}