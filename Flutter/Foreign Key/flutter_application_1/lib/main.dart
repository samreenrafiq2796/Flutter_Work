import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<String> data = [];
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();

  String? selectitem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchItems();
  }

  void savedata() {
    try {
      if (name.text.isEmpty || price.text.isEmpty || selectitem == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please fill all fields and select a category."),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        db.collection("Product").add({
          "Name": name.text,
          "Price": int.parse(price.text),
          "Category": selectitem
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Product Added"),
        ));
        clearData();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    }
  }

  void clearData() {
    name.clear();
    price.clear();
    selectitem = null;
  }

  Future<List<String>> fetchData() async {
    QuerySnapshot snap = await db.collection("Category").get();
    return (snap.docs.map((a) => a["Name"] as String).toList());
  }

  Future<void> _fetchItems() async {
    List<String> items = await fetchData();
    setState(() {
      data = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(maxWidth: 300),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                  suffixIcon: Icon(Icons.person)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(maxWidth: 300),
            child: TextField(
              controller: price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Price",
                  suffixIcon: Icon(Icons.email)),
            ),
          ),
          Container(
            child: DropdownButton<String>(
              hint: Text('Select an item'),
              value: selectitem,
              onChanged: (String? newValue) {
                setState(() {
                  selectitem = newValue!;
                });
              },
              items: data.map((item) {
                return DropdownMenuItem(
                  value: item, // Ensure unique values
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
          OutlinedButton(onPressed: savedata, child: Text("Save Product"))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
