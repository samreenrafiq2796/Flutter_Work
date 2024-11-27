import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:flutter_application_1/Signup.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
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
      debugShowMaterialGrid: false,
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
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();

  void login_func() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential ca = await auth.signInWithEmailAndPassword(
          email: b.text, password: c.text);
      Navigator.push(context, MaterialPageRoute(builder: (a) => Dash()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
        backgroundColor: Colors.red,
      ));
    }
  }



void signinGoogle() async {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  try {
    print('Attempting to sign in with Google...');

    // The new method for signing in with Google
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      print('Google sign-in successful. Fetching authentication...');
      GoogleSignInAuthentication auth = await account.authentication;

      print('Authentication successful. Signing in to Firebase...');
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in to Firebase successfully.');
      
      // Optionally, navigate to a new screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dash()),
      );
    } else {
      print('Google sign-in was canceled by user.');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Google sign-in was canceled."),
        backgroundColor: Colors.red,
      ));
    }
  } catch (e) {
    print("Error during Google sign-in: $e");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Error during Google sign-in: $e"),
      backgroundColor: Colors.red,
    ));
  }
}

void signinGoogleSilently() async {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  try {
    print('Attempting silent sign-in with Google...');
    GoogleSignInAccount? account = await googleSignIn.signInSilently();

    if (account != null) {
      print('Google sign-in successful (silent). Fetching authentication...');
      GoogleSignInAuthentication auth = await account.authentication;

      print('Authentication successful. Signing in to Firebase...');
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in to Firebase successfully.');

      // Optionally, navigate to a new screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dash()),
      );
    } else {
      print('Google sign-in silently failed. User may need to authenticate.');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Google sign-in silently failed. Please authenticate."),
        backgroundColor: Colors.red,
      ));
    }
  } catch (e) {
    print("Error during silent Google sign-in: $e");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Error during silent Google sign-in: $e"),
      backgroundColor: Colors.red,
    ));
  }
}

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

// Use the renderButton() method to add the sign-in button to your UI




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 300),
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: b,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter Email",
                  suffixIcon: Icon(Icons.email)),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 300),
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: c,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter password",
                  suffixIcon: Icon(Icons.password)),
            ),
          ),
          ElevatedButton.icon(
            onPressed: login_func,
            label: Text("Login"),
            icon: Icon(Icons.login),
            iconAlignment: IconAlignment.end,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Signup()));
                    },
                    child: Text(
                      "Don't have account",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )),
             
            ],
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextButton.icon(
                icon: FaIcon(FontAwesomeIcons.google),
                onPressed: signinGoogle,
                label: Text(
                  "Sign in With Google",
                  style: TextStyle(color: Colors.blue),
                ),
              )),
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
