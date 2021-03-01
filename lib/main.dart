import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Balaji Garments')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'B   G ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Customers'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('Items'),
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Account Details'),
            ),
          ],
        ),
      ),
    );
  }
}
