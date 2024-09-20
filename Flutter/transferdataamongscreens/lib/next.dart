import 'package:flutter/material.dart';

void main() {

}

class next extends StatelessWidget {
  final String email;
  const next({Key? key, required this.email}):super(key:key);

 


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Dashboard"),
      ),
      body: GridView(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
        ),
        children: [
          Container(
            color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.calendar_month),
                ),
                Container(
                  child: Text(this.email),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.account_balance),
                ),
                Container(
                  child: Text("About"),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.inbox),
                ),
                Container(
                  child: Text("Complain"),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.phone),
                ),
                Container(
                  child: Text("Contact"),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.help),
                ),
                Container(
                  child: Text("Help"),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.person),
                ),
                Container(
                  child: Text("Logout"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
