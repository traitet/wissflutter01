import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/AlbumModel.dart';
import 'package:http/http.dart' as http;

//==============================================================================
// MAIN CLASS
//==============================================================================
class CallApiAlbumPage extends StatefulWidget {
  const CallApiAlbumPage({Key? key}) : super(key: key);

  @override
  _CallApiAlbumPageState createState() => _CallApiAlbumPageState();
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
class _CallApiAlbumPageState extends State<CallApiAlbumPage> {
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
    return Container(
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
