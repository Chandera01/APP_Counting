import 'dart:async';
import 'package:counter_sharedpref/login_page.dart';
import 'package:counter_sharedpref/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage>{

 @override

 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool check = prefs.getBool(LoginPage.LOGIN_KEY) ?? false;

      Widget navigat = LoginPage();

      if(check){
        navigat = Homepage();
      }
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> navigat));

    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.yellow,
       body: Center(
         child: FlutterLogo(size: 200,),
       ),
      );
  }
}