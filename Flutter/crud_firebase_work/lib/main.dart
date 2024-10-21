import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase_work/AddData.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


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
  String name = "", email ="";
  void delete_record(String i){
      try {
        db.collection("Person").doc(i).delete();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Record Deleted")));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      }
  }

void update_query(String i, String n , String e){
 try {
    db.collection("Person").doc(i).update({
    "Name" : n,
    "Email": e
  });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Record Updated")));

 } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
   
 }

}

void update_dialog(BuildContext con , String id, String name, String gmail){
  TextEditingController ncontroller = TextEditingController(text:name);
  TextEditingController encontroller = TextEditingController(text:gmail);

  showDialog(context: con, 
  builder: (a)=>AlertDialog(
    title: Text("Update Record"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 200),
          margin: EdgeInsets.all(10),
          child: TextField(
           controller: ncontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:  name,
              suffixIcon: Icon(Icons.person)             
            ),
          ),
        ),

        Container(
          constraints: BoxConstraints(maxWidth: 200),
          margin: EdgeInsets.all(10),
          child: TextField(
            controller: encontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:  gmail,
              suffixIcon: Icon(Icons.email)             
            ),
          ),
        )
      ],
    ),

    actions: [
      IconButton(onPressed: (){

          Navigator.of(con).pop();
      }, icon: Icon(Icons.close)),

      IconButton(onPressed: (){
  
          update_query(id, ncontroller.text, encontroller.text);

          Navigator.of(con).pop();
      }, icon: Icon(Icons.check))
    ],
  ));
}

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body:
      StreamBuilder<QuerySnapshot>(
         stream: db.collection("Person").snapshots(),
         builder: (context, snapshot){
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,i){    
                if(snapshot.data!.docs.isEmpty || !snapshot.hasData){
                  return Center(child: Text("No Data Found"),);
                }
                if(snapshot.hasError){
                  return  Center(child: CircularProgressIndicator(),);

                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return  Center(child: CircularProgressIndicator(),);
                }
                var per = data[i].data() as Map<String,dynamic>;
                String person_id = data[i].id;
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(per["Name"]?? "no name"),
                  subtitle:  Text(per["Email"] ?? "no Email"),
                  trailing:Row(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                       IconButton(icon: Icon(Icons.delete,color: Colors.red,),
                  onPressed:(){
                    delete_record(person_id);
                  },),

                  IconButton(icon: Icon(Icons.edit,color: Colors.green,),
                  onPressed:(){
                 
                    update_dialog(context, person_id, per["Name"], per["Email"]);
                  },),
                    ]
                  )
                );
              }
              );
         }) ,
         floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (a)=>Add()));
          },
          child: Icon(Icons.add),),

      
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
