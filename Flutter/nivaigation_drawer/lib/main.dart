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
  // var s = GlobalKey<ScaffoldState>();

  final name = ["Home", "About", "Complain", "Close", "Logout"];
  final icon = [
    Icon(Icons.home),
    Icon(Icons.abc_sharp),
    Icon(Icons.comment),
    Icon(Icons.close),
    Icon(Icons.logout)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ABCD"),
        // leading: IconButton(
        //   onPressed: () => s.currentState?.openDrawer(),
        //   icon: Icon(Icons.home),
        //   color: const Color.fromARGB(255, 55, 8, 79),
        //   iconSize: 34,
        // ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Demo"),
              accountEmail: Text("demo@gmail.com"),
              currentAccountPicture: Image.network(
                  "https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-PNG-Photos.png"),
            ),
            ListView.separated(
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: icon[i],
                    title: Text(name[i]),
                  );
                },
                separatorBuilder: (context, i) => Divider(color: Colors.red),
                itemCount: name.length)
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         decoration: BoxDecoration(color: Color.fromARGB(255, 55, 8, 79)),
      //         accountName: Text(
      //           "John Doe",
      //           textAlign: TextAlign.center,
      //         ),
      //         accountEmail:
      //             Text("johndoe@gmail.com", textAlign: TextAlign.center),
      //         currentAccountPicture: Image.network(
      //             "https://www.pngplay.com/wp-content/uploads/12/User-Avatar-Profile-PNG-Photos.png"),
      //       ),
      //       ListTile(
      //         title: Text("Home"),
      //         leading: Icon(Icons.person),
      //         onTap: () {

      //         },
      //       ),
      //       ListTile(
      //         title: Text("About"),
      //         leading: Icon(Icons.notification_add),
      //       ),
      //       ListTile(
      //         title: Text("Contact"),
      //         leading: Icon(Icons.call),
      //       ),
      //     ],
      //   ),
      // ),
      body:
          Center(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
