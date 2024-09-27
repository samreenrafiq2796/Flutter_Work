import 'package:flutter/material.dart';
import 'package:tabbler_in_flutter/first.dart';

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
  

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(      
       
       flexibleSpace: Column(
        children: [
           TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.blueGrey,
          indicatorColor: Colors.amber,
          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(30), 
          //   color: Colors.amber),
        tabs: 
        [
          Tab(icon: Icon(Icons.flight)),
          Tab(icon: Icon(Icons.call)),
          Tab(icon: Icon(Icons.directions_bike))
        ]),
        ],
       ),
      ),
      body: TabBarView(
       children: [
        first(),
        Icon(Icons.home,size: 350),
        Icon(Icons.person,size: 350),
       ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
