import 'package:flutter/material.dart';
import 'package:tab_bottom_bar/Hisab.dart';

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
  var current_index = 0;
  void change_index(int i) {
    setState(() {
      current_index = i;
    });
  }

  List<Widget> pages = [
    Hisab(),
    Text("Calls"),
    Text("Video"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       
        body: Center(
          child: pages.elementAt(current_index),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.amberAccent,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.white,
            currentIndex: current_index,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: change_index,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: "Hisab"),
              BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.videocam_sharp), label: "Video"),
            ]), // This trailing comma makes auto-formatting nicer for build methods.
      
    );
  }
}
