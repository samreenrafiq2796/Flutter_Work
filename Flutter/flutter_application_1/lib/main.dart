import 'package:flutter/material.dart';
import 'package:flutter_application_1/second.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
   
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body:SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(
            image: NetworkImage("https://mrwallpaper.com/images/hd/portrait-solid-white-pattern-almaufymgbmzem2a.jpg"),
            fit: BoxFit.cover)),
          // child: Center(
          //   child: FloatingActionButton(
          //     onPressed: (){
          //       showDialog(
          //         context: context, 
          //         builder: (a)=>AlertDialog(
          //             content: Text("Are You Sure you want to close this App?"),
          //             title: Text("Confirmation"),
          //             icon: Icon(Icons.question_mark),
          //             iconColor: Colors.red,
          //             actions: [
          //               OutlinedButton(
          //                 onPressed: (){

          //                     Navigator.of(a).pop();
          //                 }, 
          //                 child: Text("Yes")),

          //               OutlinedButton(
          //                 onPressed: (){}, 
          //                 child: Text("No")),
          //             ],
          //         ));
          //     },
          //     child: FaIcon(FontAwesomeIcons.facebook,
          //     color: Colors.blue,
          //     size: 36,),
          //   ),
          // ),

        child:Center(
          child: OutlinedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (i)=>second()));
            }, 
            child: Text("Go to Second Page")),
        )





        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
