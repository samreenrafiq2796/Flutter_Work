import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Signup.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Signin());
}

class Signin extends StatelessWidget {
  const Signin({super.key});

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
   FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void Signin() async{
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text).whenComplete((){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Signin")));

        }); 
  }

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
              onPressed:Signin,
              child: Text("Submit"),
            ),
           TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (a)=>Signup()));
            }, child: Text("Create Your Account"))
          ],
        ),
      ),
    );// This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
