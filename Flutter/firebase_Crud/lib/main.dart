import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/showdata.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  String name = "", email="", pswd="";

FirebaseFirestore db = FirebaseFirestore.instance;
void savedata(){
  try {
    db.collection("Person").add({
    "Name":name,
    "Email":email,
    "Password":pswd
  });
  print("Data Saved");
  } catch (e) {
    print("$e");
  }
  
}
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                onChanged: (va)=>setState(() {
                  name = va;
                }),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                  prefixIcon: Icon(Icons.person)
                ),
              ),
            ),

              Container(
              margin: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                onChanged: (va)=>setState(() {
                  email = va;
                }),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Email",
                  prefixIcon: Icon(Icons.email)
                ),
              ),
            ),

              Container(
               margin: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                onChanged: (va)=>setState(() {
                  pswd = va;
                }),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.remove_red_eye)
                ),
              ),
            ),

            TextButton.icon(
              
              onPressed: savedata, 
              icon: Icon(Icons.login), 
              label: Text("Register")),
            TextButton.icon(
              
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (builder)=>ShowData()));
              }, 
              icon: Icon(Icons.data_array), 
              label: Text("Read Data")),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
