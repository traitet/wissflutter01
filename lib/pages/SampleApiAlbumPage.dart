import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/ApiAlbumModel.dart';
import 'package:http/http.dart' as http;

//==============================================================================
// MAIN CLASS
//==============================================================================
class SampleApiAlbumPage extends StatefulWidget {
  const SampleApiAlbumPage({Key? key}) : super(key: key);

  @override
  _SampleApiAlbumPageState createState() => _SampleApiAlbumPageState();
}

//==============================================================================
// FUNCTION: FETCH ALBUM
//==============================================================================
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

//==============================================================================
// STATE CLASS
//==============================================================================
class _SampleApiAlbumPageState extends State<SampleApiAlbumPage> {
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
        appBar: AppBar(title: Text('Call API Album')),
        body: Center(
          child: FutureBuilder<Album>(
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
                          Text('User ID:' + snapshot.data!.userId.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          Text('Title: ' + snapshot.data!.title,
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
