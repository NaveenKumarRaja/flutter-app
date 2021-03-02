import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Customers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new DrawerCodeOnly(),
        appBar: new AppBar(
          title: new Text("Customers"),
        ),
        body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatelessWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Customer Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Phone No',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Address',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarathi')),
            DataCell(Text('789256919')),
            DataCell(Text('Sulur')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Johny')),
            DataCell(Text('9548894443')),
            DataCell(Text('Perundurai')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('9834563427')),
            DataCell(Text('Tirupur')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarathi')),
            DataCell(Text('789256919')),
            DataCell(Text('Sulur')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Jaga')),
            DataCell(Text('95483494443')),
            DataCell(Text('Perundurai')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Alagar')),
            DataCell(Text('9834453427')),
            DataCell(Text('Tiruvanamalai')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Saraswathi')),
            DataCell(Text('8789256919')),
            DataCell(Text('Sundharapuam')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Joe')),
            DataCell(Text('9548894433')),
            DataCell(Text('Perumanullr')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Barathan')),
            DataCell(Text('9834565627')),
            DataCell(Text('Tirupathi')),
          ],
        ),
      ],
    );
  }
}
