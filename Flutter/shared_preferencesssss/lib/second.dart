import 'package:flutter/material.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {}

class Second extends StatelessWidget {
  const Second({super.key});

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
  String email = "", getPswd = "";

  void getData()async {
      SharedPreferences pref = await SharedPreferences.getInstance();

    setState(()  {
      if (pref.containsKey("mail")) {
        email = pref.getString("mail").toString();
        getPswd = pref.getString("key").toString();
      }
      else{
    Navigator.push(context, MaterialPageRoute(builder: (a) => MyApp()));

      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
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
            child: Text(email),
          )
        ],
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
