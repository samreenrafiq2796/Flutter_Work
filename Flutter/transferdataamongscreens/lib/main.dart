import 'package:flutter/material.dart';
import 'package:transferdataamongscreens/next.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'USER LOGIN FORM'),
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
  String getEmail = "";
  String getPassword = "";

  String dataEmail = "Email";
  String dataPassword = "";

  void textbox_Value() {
    setState(() {
      dataEmail = getEmail;
      dataPassword = getPassword;

      if (getEmail == "admin@gmail.com" && getPassword == "123") {
         Navigator.push(
                        context, MaterialPageRoute(builder: (a) => next(email: dataEmail)));
      }
      else{
        print("invalid Creentials");
      }
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://static.vecteezy.com/system/resources/thumbnails/006/487/917/small_2x/man-avatar-icon-free-vector.jpg",
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "< USER LOGIN FORM > ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.blue,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email Address",
                    labelText: " Email Address",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onChanged: (value) => getEmail = value,
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    labelText: " Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.remove_red_eye),
                  ),
                  onChanged: (value) => getPassword = value,
                ),
              ),
              Container(
                child: OutlinedButton(
                  onPressed: textbox_Value,
                  child: Text("Next Page"),
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    backgroundColor: Color.fromARGB(255, 255, 136, 0),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ])));
  }
}
