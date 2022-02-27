import 'package:flutter/material.dart';
import '../models/InterfaceSapPoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//==============================================================================
// MAIN CLASS
//==============================================================================
class InterfaceSapPoPage extends StatefulWidget {
  const InterfaceSapPoPage({Key? key}) : super(key: key);

  @override
  _InterfaceSapPoPageState createState() => _InterfaceSapPoPageState();
}

//==============================================================================
// FUNCTION: FETCH DATA
//==============================================================================
Future<List<InterfaceSapPoModel>> fetchApi() async {
  final response = await http.get(Uri.parse(
      'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_po'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<InterfaceSapPoModel> listApiSapInterfaceModel;
    listApiSapInterfaceModel = (json.decode(response.body) as List)
        .map((data) => new InterfaceSapPoModel.fromJson(data))
        .toList();
    return listApiSapInterfaceModel;
    // return ApiSapInterfaceModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

//==============================================================================
// STATE CLASS
//==============================================================================
class _InterfaceSapPoPageState extends State<InterfaceSapPoPage> {
//==============================================================================
// DECLARE VARIABLE
//==============================================================================
  var futureListApiData;
//==============================================================================
// SET STATE
//==============================================================================
  @override
  void initState() {
    super.initState();
    futureListApiData = fetchApi();
  }

//==============================================================================
// BUILD WIDGET
//==============================================================================
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Interface SAP PO - All'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Column(
          children: [
            // Container(
            //   height: 300,
            //   child: Card(
            //     color: Colors.yellow.shade300,
            //     child: Wrap(
            //       children: [
            //         Text('Search'),
            //         TextField(
            //           decoration: InputDecoration(
            //             border: OutlineInputBorder(),
            //             hintText: 'Enter Document Number',
            //           ),
            //         ),
            //         Text(''),
            //         ButtonBar()
            //       ],
            //     ),
            //   ),
            // ),
//==============================================================================
// TABLE
//==============================================================================
            Expanded(
              child: ListView(
                children: [
                  FutureBuilder<List<InterfaceSapPoModel>>(
                    future: futureListApiData,
                    builder: (context, snapshot) {
//==============================================================================
// IF HAVE DATA
//==============================================================================
                      if (snapshot.hasData) {
                        return Container(
                            // height: 80,
                            width: double.infinity,
//==============================================================================
// SINGLE CHILD SCROLL VIEW
//==============================================================================
                            child: Container(
                              color: Colors.blue.shade50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
//==============================================================================
// DATATABLE
//==============================================================================
                                  child: DataTable(
                                    columnSpacing: 38,
                                    columns: [
                                      DataColumn(label: Text('RIDTTIFPO')),
                                      DataColumn(label: Text('PONUM')),
                                      DataColumn(label: Text('ITEMID')),
                                      DataColumn(label: Text('DOCTYPE')),
                                      DataColumn(label: Text('VENDORID')),
                                      DataColumn(label: Text('PAYMENTTERM')),
                                    ],
                                    rows: snapshot.data!
                                        .map((data) => DataRow(cells: [
                                              DataCell(
                                                  Text(data.RIDTTIFPO ?? '')),
                                              DataCell(Text(data.PONUM ?? '')),
                                              DataCell(Text(data.ITEMID ?? '')),
                                              DataCell(
                                                  Text(data.DOCTYPE ?? '')),
                                              DataCell(
                                                  Text(data.VENDORID ?? '')),
                                              DataCell(
                                                  Text(data.PAYMENTTERM ?? '')),
                                            ]))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ));
//==============================================================================
// IF NO DATA
//==============================================================================
                        // Text(snapshot.data!.title);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
