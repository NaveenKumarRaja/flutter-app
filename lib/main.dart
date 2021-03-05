import 'package:flutter/material.dart';
import 'package:myapp/Accounts.dart';
import 'package:myapp/Customers.dart';
import 'package:myapp/Items.dart';
import 'package:myapp/forms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDrawerApp(),
    );
  }
}

class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: DrawerCodeOnly(),
      appBar: new AppBar(
          centerTitle: true,
          title: new Text("Balaji Garmets"),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new Forms()));
              },
              icon: Icon(Icons.add),
            )
          ]),
      body: new Text('hello'),
    );
  }
}

class DrawerCodeOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: Text("BALAJI GARMENTS"),
            decoration: new BoxDecoration(color: Colors.blue),
          ),
          new ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new MyApp()));
            },
          ),
          new ListTile(
            leading: Icon(Icons.person),
            title: Text('Customers'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Customers()));
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text('Items'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Items()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Account Details'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Accounts()));
            },
          ),
        ],
      ),
    );
  }
}
