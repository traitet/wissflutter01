import 'package:flutter/material.dart';

//==============================================================================
// MAIN CLASS
//==============================================================================
class ReportTemplatePage extends StatefulWidget {
  @override
  _ReportTemplatePageState createState() => _ReportTemplatePageState();
}

//==============================================================================
// STATE CLASS
//==============================================================================
class _ReportTemplatePageState extends State<ReportTemplatePage> {
  @override
  Widget build(BuildContext context) {
//==============================================================================
// SCAFFOLD
//==============================================================================
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Template Page'),
      ),
//==============================================================================
// BODY
//==============================================================================
      body: ListView(
        children: [
//==============================================================================
// COLUMN#1
//==============================================================================
          Container(
              width: double.infinity,
              color: Colors.pink,
              alignment: Alignment.centerLeft,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Data Table',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
//==============================================================================
// COLUMN#2
//==============================================================================
          BuildDataTable(),
//==============================================================================
// COLUMN#3
//==============================================================================
          Container(
              width: double.infinity,
              color: Colors.pink,
              alignment: Alignment.centerLeft,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Data Table with Checked box',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
//==============================================================================
// COLUMN#3
//==============================================================================
          BuildDataTableCheckBox(),
        ],
      ),
    );
  }
}

//==============================================================================
// BUILD DATA TABLE CLASS
//==============================================================================
class BuildDataTable extends StatelessWidget {
  const BuildDataTable({Key? key}) : super(key: key);
//==============================================================================
// BUILD
//==============================================================================
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
//==============================================================================
// COLUMN
//==============================================================================
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Age',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Role',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
//==============================================================================
// ROW
//==============================================================================
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Sarah')),
              DataCell(Text('19')),
              DataCell(Text('Student')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Janine')),
              DataCell(Text('43')),
              DataCell(Text('Professor')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('William')),
              DataCell(Text('27')),
              DataCell(Text('Associate Professor')),
            ],
          ),
        ],
      ),
    );
  }
}

//==============================================================================
// CLASS - STATEFULL
//==============================================================================
class BuildDataTableCheckBox extends StatefulWidget {
  const BuildDataTableCheckBox({Key? key}) : super(key: key);

  @override
  State<BuildDataTableCheckBox> createState() => _BuildDataTableCheckBoxState();
}

//==============================================================================
// STATE CLASS
//==============================================================================
class _BuildDataTableCheckBoxState extends State<BuildDataTableCheckBox> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
//==============================================================================
// COLUMN
//==============================================================================
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Number'),
          ),
        ],
//==============================================================================
// ROW
//==============================================================================
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
            color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              // All rows will have the same selected color.
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
              }
              // Even rows will have a grey color.
              if (index.isEven) {
                return Colors.grey.withOpacity(0.3);
              }
              return null; // Use default value for other states and odd rows.
            }),
            cells: <DataCell>[DataCell(Text('Row $index'))],
            selected: selected[index],
            onSelectChanged: (bool? value) {
              setState(() {
                selected[index] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
