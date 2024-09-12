import 'package:flutter/material.dart';

void main() {}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Dashboard"),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
               crossAxisSpacing: 10
                ),
          children: [
            Container(
              decoration: BoxDecoration(color:Colors.pink),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bike_scooter, color: Colors.white,size: 56,),
                  Text("Home")
                ],
              ),
            ),

             Container(
              decoration: BoxDecoration(color:Colors.red),
              child: Column(
                children: [
                  Icon(Icons.pending),
                  Text("Help")
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color:Colors.pink),
              child: Column(
                children: [
                  Icon(Icons.bike_scooter),
                  Text("Home")
                ],
              ),
            ),

             Container(
              decoration: BoxDecoration(color:Colors.red),
              child: Column(
                children: [
                  Icon(Icons.pending),
                  Text("Help")
                ],
              ),
            )

          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
