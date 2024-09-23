import 'package:flutter/material.dart';
import 'package:shared_preference/second.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
  String email = "", getEmail = "", pswd = "", getPswd = "";

  void get_textbox_value() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(()  {
      getEmail = email;
      getPswd = pswd;

      prefs.setString("mail", getEmail);
      prefs.setString("pswd", getPswd);
      Navigator.push(context, MaterialPageRoute(builder: (a) => Second()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                onChanged: (a) => email = a,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                    suffixIcon: Icon(Icons.person_4)),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                onChanged: (a) => pswd = a,
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
    );
  }
}
