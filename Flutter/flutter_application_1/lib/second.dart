import 'package:flutter/material.dart';
import 'package:flutter_application_1/third.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(const second());
}

class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text("Second Page"),
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
              Navigator.push(context, MaterialPageRoute(builder: (a)=>third()));
            }, 
            child: Text("Go to Third Page")),
        )





        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
