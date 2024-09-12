import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const third());
}

class third extends StatelessWidget {
  const third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Third Page"),
        ),
        body: SizedBox.expand(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://mrwallpaper.com/images/hd/portrait-solid-white-pattern-almaufymgbmzem2a.jpg"),
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

              child: Center(
                child: Row(
                  children: [
                    Container(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (f)=>MyApp()));
                          }, child: Text("Go to First Page")),
                    ),
                    Container(
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Go Back"))
                    ),
                  ],
                ),
              )),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
