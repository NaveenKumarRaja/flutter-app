import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Accounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar(
          centerTitle: true,
          title: new Text("Accounts"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Show Snackbar',
                onPressed: () {})
          ]),
      body: new Text("hi this the Accounts list"),
    );
  }
}
