import 'package:flutter/material.dart';

import 'Customers.dart';

class Forms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Customers Forms"),
        ),
        body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController address = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              hintText: 'Enter Customer Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: phoneNumber,
            decoration: const InputDecoration(
              hintText: 'Enter Phone Number',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: address,
            decoration: const InputDecoration(
              hintText: 'Enter Address ',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Address';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                Customer customer = new Customer();
                customer.name = name.text;
                customer.phoneNumber = phoneNumber.text;
                customer.address = address.text;

                Customer.addCustomer(customer);

                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new CustomersWidget()));

                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
