import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/forms.dart';
import 'package:myapp/main.dart';

class Customers extends StatelessWidget {
  final TextEditingController searchBox = TextEditingController();

  get onSearchTextChanged => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new DrawerCodeOnly(),
        appBar:
            new AppBar(title: new Text("Customers Details"), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Forms()));
            },
          ),
        ]),
        body: new Column(children: <Widget>[
          new Container(
            color: Theme.of(context).primaryColor,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: searchBox,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      searchBox.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: MyStatefulWidget(),
          )
        ]));
  }
}

class Customer {
  static List<Customer> customers = new List<Customer>();
  String name;
  String phoneNumber;
  String address;

  static Customers customer;

  static List<Customer> getCustomers() {
    /*List<Customer> customers = new List<Customer>();
    Customer customer1 = new Customer();
    customer1.name = "Naveen";
    customer1.phoneNumber = "87585766";
    customer1.address = "tau";
    customers.add(customer1);
    Customer customer2 = new Customer();
    customer2.name = "Naven";
    customer2.phoneNumber = "87585766";
    customer2.address = "tau";
   customers.add(customer2); */
    return customers;
  }

  static void addCustomer(Customer customer) {
    customers.add(customer);
  }

  static void removeCustomer(Customer customer) {
    customers.remove(customer);
  }
}

class MyStatefulWidget extends StatelessWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: <Widget>[
      DataTable(
        columns: [
          DataColumn(
              label: Text('Customer Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Phone No',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Delete',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: Customer.getCustomers()
            .map((customer) => DataRow(cells: [
                  DataCell(Text(customer.name)),
                  DataCell(Text(customer.phoneNumber)),
                  DataCell(Text(customer.address)),
                  DataCell(IconButton(
                    onPressed: () {
                      Customer.removeCustomer(customer);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Customers()));
                    },
                    icon: Icon(Icons.delete),
                  ))
                ]))
            .toList(),
      ),
    ]);
  }
}
