import 'package:autorization_flutter/Signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Signup());
}

class Signup extends StatelessWidget {
  const Signup({super.key});

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Name Field
            TextFormField(
              controller: _nameController, // Connect controller
              decoration: InputDecoration(labelText: "Name"),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),

            // Email Field
            TextFormField(
              controller: _emailController, // Connect controller
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            // Password Field
            TextFormField(
              controller: _passwordController, // Connect controller
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submitData,
              child: Text("Submit"),
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (a)=>Signin()));
            }, child: Text("Already Have Account"))
          ],
        ),
      ),
    );
    
    // This trailing comma makes auto-formatting nicer for build methods.
    
  }

  void _submitData() async {
   try {
      FirebaseAuth db = FirebaseAuth.instance;
   UserCredential user = await db.createUserWithEmailAndPassword(
      email: _emailController.text, 
      password: _passwordController.text);
    FirebaseFirestore dbs = FirebaseFirestore.instance;
    dbs.collection("Person").add({
      "Name":_nameController.text,
      "Email":_emailController.text,
      "Password":_passwordController.text
    });
    User? users = db.currentUser;

      // Send email verification
      if (users != null && !users.emailVerified) {
        await users.sendEmailVerification();
        print("Verification email sent to ${users.email}");
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User created Sussfully")));
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>Signin()));
   } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
     
   }
  }
}

