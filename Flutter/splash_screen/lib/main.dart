import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splash/Dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 void initState(){
  super.initState();
  Timer((Duration(seconds: 3)), ()=>Navigator.pushReplacement(context, 
  MaterialPageRoute(builder: (a)=>Dashboard())));
 }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      body: Center(
       child: Image.network("https://static.vecteezy.com/system/resources/thumbnails/024/398/617/small/whatsapp-logo-icon-isolated-on-transparent-background-free-png.png",
       width: 200,
       height: 200,)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
