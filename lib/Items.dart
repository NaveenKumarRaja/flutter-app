import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new DrawerCodeOnly(),
      appBar: new AppBar(
          centerTitle: true,
          title: new Text("Items"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Show Snackbar',
                onPressed: () {})
          ]),
      body: MyStatefulWidget(),
    );
  }
}

class Item {
  String itemName;
  String totalQuantity;
  String purchasedQuantity;
  String availableQuantity;

  static List<Item> getItems() {
    List<Item> items = new List<Item>();
    Item items1 = new Item();
    items1.itemName = "Black";
    items1.totalQuantity = "875";
    items1.purchasedQuantity = "600";
    items1.availableQuantity = "275";
    items.add(items1);

    Item items2 = new Item();
    items2.itemName = "Red";
    items2.totalQuantity = "1000";
    items2.purchasedQuantity = "600";
    items2.availableQuantity = "400";
    items.add(items2);

    Item items3 = new Item();
    items3.itemName = "Blue";
    items3.totalQuantity = "1875";
    items3.purchasedQuantity = "1600";
    items3.availableQuantity = "275";
    items.add(items3);

    return items;
  }
}

class MyStatefulWidget extends StatelessWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: <Widget>[
      DataTable(
        columns: [
          DataColumn(
              label: Text('Item Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Total Quatity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Purchased Quatity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Available Quantity ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: Item.getItems()
            .map((customer) => DataRow(cells: [
                  DataCell(Text(customer.itemName)),
                  DataCell(Text(customer.totalQuantity)),
                  DataCell(Text(customer.purchasedQuantity)),
                  DataCell(Text(customer.availableQuantity)),
                ]))
            .toList(),
      ),
    ]);
  }
}
