import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double engmarks = 0, mathsmarks = 0, urdumarks = 0;
  String eng = "", math = "", urdu = "", grade = "";
  double total = 0, per = 0;
  void calculate() {
    setState(() {
      engmarks = double.parse(eng);
      mathsmarks = double.parse(math);
      urdumarks = double.parse(urdu);

      if (engmarks > 100 || urdumarks > 100 || mathsmarks > 100) {
        Fluttertoast.showToast(
          msg: "Invalid Marks",
          timeInSecForIosWeb: 6,
          backgroundColor: Colors.amber,
          textColor: Colors.black,
          gravity: ToastGravity.CENTER);

          engmarks = 0;
          urdumarks = 0;
          mathsmarks = 0;
          total = 0;
          per=0;
          grade="inavlid";
          Navigator.of(context).pop();


      } else {
        total = engmarks + mathsmarks + urdumarks;
        per = (total * 100) / 300;
        if (per >= 90) {
          grade = "A+";
        } else if (per > 80) {
          grade = "A";
        } else if (per > 70) {
          grade = "B";
        } else if (per > 60) {
          grade = "C";
        } else {
          grade = "Fail";
        }
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter English Marks",
                    hintText: "Enter English Marks",
                    suffixIcon: Icon(Icons.numbers)),
                onChanged: (a) => eng = a,
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Urdu Marks",
                    hintText: "Enter Urdu Marks",
                    suffixIcon: Icon(Icons.numbers)),
                onChanged: (a) => urdu = a,
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Maths Marks",
                    hintText: "Enter Maths Marks",
                    suffixIcon: Icon(Icons.numbers)),
                onChanged: (a) => math = a,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Marksheet"),
                        content: Text("Do you want to calculate your marks?"),
                        icon: Icon(Icons.question_answer),
                        actions: [
                          OutlinedButton(
                              onPressed: calculate, child: Text("Yes")),
                          OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                
                              },
                              child: Text("No")),
                        ],
                      ),
                    );
                  },
                  child: Text("Calculate")),
            ),
            Container(
              child: DataTable(columns: [
                DataColumn(label: Text("English")),
                DataColumn(label: Text("Urdu")),
                DataColumn(label: Text("Maths")),
                DataColumn(label: Text("Total")),
                DataColumn(label: Text("Percentage")),
                DataColumn(label: Text("Grade")),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text(engmarks.toString())),
                  DataCell(Text(urdumarks.toString())),
                  DataCell(Text(mathsmarks.toString())),
                  DataCell(Text(total.toString())),
                  DataCell(Text(per.toString() + "%")),
                  DataCell(Text(grade)),
                ])
              ]),
            )
          ],
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
