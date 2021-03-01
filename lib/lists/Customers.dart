/// Flutter code sample for DataTable

// This sample shows how to display a [DataTable] with three columns: name, age, and
// role. The columns are defined by three [DataColumn] objects. The table
// contains three rows of data for three example users, the data for which
// is defined by three [DataRow] objects.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/data_table.png)

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
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
      ],
    );
  }
}
