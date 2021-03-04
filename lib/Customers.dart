import 'package:flutter/material.dart';
import 'package:myapp/forms.dart';
import 'package:myapp/main.dart';

class Customers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new DrawerCodeOnly(),
        appBar: new AppBar(title: new Text("Customers"), actions: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Forms()));
            },
            child: Icon(Icons.add),
          ),
        ]),
        body: MyStatefulWidget());
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

  void add(Customer customer) {}
}

class MyStatefulWidget extends StatelessWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Center(
          child: Text(
        'Customer Details',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      )),
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
        ],
        rows: Customer.getCustomers()
            .map((customer) => DataRow(cells: [
                  DataCell(Text(customer.name)),
                  DataCell(Text(customer.phoneNumber)),
                  DataCell(Text(customer.address)),
                ]))
            .toList(),
      ),
    ]);
  }
}
