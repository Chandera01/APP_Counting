import 'dart:math';

import 'package:counter_sharedpref/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyappState();
}

class _MyappState extends State<Myapp>{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
       home: SplashPage(),
      );
  }
}

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{

  var nameController = TextEditingController();
  var name = "name";
  int  Counter = 0;

  @override
  void initState() {
    super.initState();
    getValuefromprefs();
    manageCount();
  }
  void getValuefromprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name") ?? "";
    setState(() {

    });
  }

  void manageCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Counter = prefs.getInt("Count") ?? 0;
    
    Counter++;
    
    prefs.setInt("Count", Counter);

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Counter%3==0 ? Colors.primaries[Random().nextInt(Colors.primaries.length)] : Colors.white,
     appBar: AppBar(
      title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
      centerTitle: true,
    ),
     body: Center(
       child: Column(
         children: [
           Text(name!= "" ? "Welcome $name" : "" ),
           Text("You have open app $Counter time"),
           TextField(
             controller: nameController,
           ),
           ElevatedButton(onPressed: () async {
             SharedPreferences prefs = await SharedPreferences.getInstance();
             prefs.setString("name",nameController.text);
           }, child: Text("save")),

         ],
       ),
     ),
   );
  }
}