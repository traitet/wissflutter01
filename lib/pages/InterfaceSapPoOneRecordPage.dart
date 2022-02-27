import 'package:flutter/material.dart';
import '../models/InterfaceSapPoModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//==============================================================================
// MAIN CLASS
//==============================================================================
class InterfaceSapPoOneRecordPage extends StatefulWidget {
  const InterfaceSapPoOneRecordPage({Key? key}) : super(key: key);

  @override
  _InterfaceSapPoOneRecordPageState createState() =>
      _InterfaceSapPoOneRecordPageState();
}

//==============================================================================
// FUNCTION: FETCH DATA
//==============================================================================
Future<InterfaceSapPoModel> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'http://10.100.1.94:8080/wissdemo01/public/api/interface_sap_po'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<InterfaceSapPoModel> listApiSapInterfaceModel;
    listApiSapInterfaceModel = (json.decode(response.body) as List)
        .map((data) => new InterfaceSapPoModel.fromJson(data))
        .toList();

    return listApiSapInterfaceModel[0];
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
class _InterfaceSapPoOneRecordPageState
    extends State<InterfaceSapPoOneRecordPage> {
//==============================================================================
// DECLARE VARIABLE
//==============================================================================
  var futureAlbum;
//==============================================================================
// SET STATE
//==============================================================================
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

//==============================================================================
// BUILD WIDGET
//==============================================================================
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Call API - Interface SAP PO')),
        body: Center(
          child: FutureBuilder<InterfaceSapPoModel>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: 80,
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text('ID: ' + snapshot.data!.id.toString(),
                          //     style: TextStyle(fontSize: 20, color: Colors.white)),
                          Text(
                              'RIDTTIFPO:' +
                                  snapshot.data!.RIDTTIFPO.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          Text('PONUM: ' + snapshot.data!.PONUM.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ]),
                  ),
                );

                // Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
