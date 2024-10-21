import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Add());
}

class Add extends StatelessWidget {
  const Add({super.key});

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
  FirebaseFirestore db = FirebaseFirestore.instance;
 String email = "", getEmail = "", pswd = "", getPswd = "", name="", get_name="";
 TextEditingController ncontroller = TextEditingController();
 TextEditingController econtroller = TextEditingController();
 TextEditingController pcontroller = TextEditingController();



  void get_textbox_value()  {
    setState(()  {
      
try {
     db.collection("Person").add({
        "Name":ncontroller.text,
        "Email":econtroller.text,
        "Password":pcontroller.text,

      });
      ncontroller.clear();
      econtroller.clear();
      pcontroller.clear();


     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Saved"), backgroundColor: Colors.green,action: SnackBarAction(label: "Ok", onPressed: (){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
     })));
     
      print("Data Saved Successfully");

    
} catch (e) {
  print(e);
}
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body:Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                controller: ncontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Name",
                    suffixIcon: Icon(Icons.person_4)),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                               controller: econtroller,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                    suffixIcon: Icon(Icons.email)),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                               controller: pcontroller,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    suffixIcon: Icon(Icons.lock)),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
                onPressed: get_textbox_value,
                icon: Icon(Icons.turn_right),
                label: Text("Save Data")),
          )
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
