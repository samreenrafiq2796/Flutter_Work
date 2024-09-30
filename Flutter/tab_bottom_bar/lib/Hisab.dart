import 'package:flutter/material.dart';

void main() {
  runApp(const Hisab());
}

class Hisab extends StatelessWidget {
  const Hisab({super.key});

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
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          flexibleSpace: Column(
            children: [
              TabBar(tabs: [
                Tab(icon: Icon(Icons.group)),
                Tab(icon: Icon(Icons.notification_add)),
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.group)),
                Tab(icon: Icon(Icons.watch)),
              ])
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
          children: [
            Text("A"),
            Text("B"),
            Text("C"),
            Text("D"),
            Text("E"),

          ],
        ),
        )// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
