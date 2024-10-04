import 'package:flutter/material.dart';
import 'package:nav_drawer/Home.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          )),
      drawer: Drawer(
        child: ListView(children: [
          Center(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2022/10/21/21/11/art-7537962_640.jpg"),
                      fit: BoxFit.cover)),
              accountName: Text(
                "Demo",
                textAlign: TextAlign.center,
              ),
              accountEmail: Text(
                "demo@gmail.com",
                textAlign: TextAlign.center,
              ),
              currentAccountPicture: Image.network(
                  "https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-PNG-Photos.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (a) => Home()));
            },
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text("Contact"),
          ),
          ListTile(
            title: Text(
              "Some Text",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("Group"),
          ),
          ListTile(
            leading: Icon(Icons.logo_dev),
            title: Text("Logout"),
          ),
        ]),
      ),
      body: Center(child: Text("Home")),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
