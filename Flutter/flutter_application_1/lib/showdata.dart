import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ShowData());
}

class ShowData extends StatelessWidget {
  const ShowData({super.key});

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
        
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("Person").snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child:CircularProgressIndicator(color: Colors.white,));
          } 
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"),);
          }
          if(snapshot.data!.docs.isEmpty){
            return Center(child:Text("No Data"));
          }
          var a = snapshot.data!.docs;
          return ListView.builder(
            itemCount: a.length,
            itemBuilder: (context, index) {
              var user = a[index].data() as Map<String, dynamic>;
              return ListTile(
                title: Text(user['Name'] ?? 'No Name'),
                subtitle: Text(user['Email'] ?? 'No Email'),
              );
        });
        }
      ) 
        )  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
