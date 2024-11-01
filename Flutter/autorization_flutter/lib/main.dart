import 'package:autorization_flutter/Signin.dart';
import 'package:autorization_flutter/Signup.dart';
import 'package:autorization_flutter/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
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
  
FirebaseAuth db = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream:FirebaseAuth.instance.authStateChanges() ,
       builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);

          }
          else if(snapshot.hasData){
            return Dashboard();
          }
          else{
            return Signup();
          }
       });
  }
}
