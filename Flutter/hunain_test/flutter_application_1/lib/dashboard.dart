import 'package:flutter/material.dart';
import 'package:flutter_application_1/about.dart';
import 'package:flutter_application_1/contact.dart';
import 'package:flutter_application_1/help.dart';
import 'package:flutter_application_1/logout.dart';
import 'package:flutter_application_1/raq.dart';
import 'package:flutter_application_1/setting.dart';

void main() {
  runApp(const dashboard());
}

class dashboard extends StatelessWidget {
  const dashboard({super.key});

 

 
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     
     body:GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
       mainAxisSpacing: 10
        
      ),
      children: [ 
          Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 214, 135, 161)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             OutlinedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>raq()));
          },
         child: Text("RAQ",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
       


        Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 211, 138, 162)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             OutlinedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>about()));
          },
          child: Text("ABOUT",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),


         Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 201, 135, 212)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>contact()));
          },
         child: Text("CONTACT",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),


         Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 140, 94, 148)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             OutlinedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>help()));
          },
         child: Text("HELP",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),


         Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 163, 141, 202)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             OutlinedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>setting()));
          },
         child: Text("SETTING",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),


         Container(
          decoration: BoxDecoration(color: const Color.fromARGB(255, 109, 101, 131)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             OutlinedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>logout()));
          },
         child: Text("LOGOUT",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
           ],
       
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}