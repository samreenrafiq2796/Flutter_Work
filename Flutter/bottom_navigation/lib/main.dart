import 'package:flutter/material.dart';

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
  List<Widget> _pages = [
    ListView(
      children: [
        Card(child: ListTile(title: Text("Heading"))),
        Card(child: ListTile(title: Text("Heading"))),
        Card(child: ListTile(title: Text("Heading")))
        ],),

      Text('Home Page', 
          style: TextStyle(
            fontSize: 35, 
            fontWeight: FontWeight.bold)),


      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
               
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                    suffixIcon: Icon(Icons.person_4)),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              constraints: BoxConstraints(maxWidth: 300),
              child: TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    suffixIcon: Icon(Icons.lock)),
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.turn_right),
                label: Text("Save Data")),
          )
        ],
      )
  ];
  
  
  
  int selectedindex = 0;

  void tap(int i) {
    setState(() {
      selectedindex = i;
      print(selectedindex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:_pages.elementAt(selectedindex) ,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedindex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.yellow,
          onTap: tap,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.safety_check), label: "Check")
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
