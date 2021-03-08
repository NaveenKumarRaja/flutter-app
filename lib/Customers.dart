import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/forms.dart';
import 'package:myapp/main.dart';

class CustomersWidget extends StatelessWidget {
  final TextEditingController searchBox =
      TextEditingController(text: Customer.searchString);

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
                    onSubmitted: (t) {
                      Customer.searchString = t;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new CustomersWidget()));
                    },
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      searchBox.clear();
                      Customer.searchString = null;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new CustomersWidget()));
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
  static List<Customer> customers = customerStub;
  String name;
  String phoneNumber;
  String address;

  static CustomersWidget customer;
  static String searchString;

  static get customerStub {
    List<Customer> customers = new List<Customer>();
    Customer customer1 = new Customer();
    customer1.name = "Naveen";
    customer1.phoneNumber = "87585766";
    customer1.address = "tau";
    customers.add(customer1);
    Customer customer2 = new Customer();
    customer2.name = "Naven";
    customer2.phoneNumber = "87585766";
    customer2.address = "tau";
    customers.add(customer2);
    return customers;
  }

  static List<Customer> getCustomers() {
    return filterCustomer(searchString);
  }

  static void addCustomer(Customer customer) {
    customers.add(customer);
  }

  static void removeCustomer(Customer customer) {
    customers.remove(customer);
  }

  static List<Customer> filterCustomer(String searchString) {
    if (searchString == null || searchString.isEmpty) {
      return customers;
    }
    return customers
        .where((customer) => customer.name.contains(searchString))
        .toList();
  }
}

class MyStatefulWidget extends StatelessWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    return ListView.builder(

        //Even if zero elements to update scroll
        itemCount: Customer.getCustomers().length,
        itemBuilder: (context, index) {
          return Container(
              child: ListTile(
                  leading: CircleAvatar(radius: 20),
                  title: Text(
                    Customer.getCustomers().elementAt(index).name,
                    //style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(Customer.customers[index].phoneNumber),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Text(Customer.customers[index].address);
                  }
                  // onTap

                  ));
        });

    /* return Text(
      'Hello, ! How are you?',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );*/
    /*return Container(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: Customer.customers.length,
                  itemBuilder: (context, int index) {
                    return Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
                        height: 170,
                        width: double.maxFinite,
                        child: Card(
                            elevation: 5,
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: 2.0,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Stack(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 5),
                                                child: Column(
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.person,
                                                          size: 50,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                Customer
                                                                    .customers
                                                                    .elementAt(
                                                                        index)
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            Customer.customers
                                                                .elementAt(
                                                                    index)
                                                                .address,
                                                            textAlign: TextAlign
                                                                .center,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      children: <Widget>[
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: Text(
                                                            Customer.customers
                                                                .elementAt(
                                                                    index)
                                                                .phoneNumber,
                                                            textAlign:
                                                                TextAlign.left,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )))));
                  }))
        ]));*/
  }
}
