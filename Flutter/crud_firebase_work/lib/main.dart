import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


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
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
         stream: db.collection("Person").snapshots(),
         builder: (context, snapshot){
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,i){    
                var per = data[i].data() as Map<String,dynamic>;
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(per["Name"]?? "no name"),
                  subtitle:  Text(per["Email"] ?? "no Email"),
                );
              }
              );
         })
      
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
