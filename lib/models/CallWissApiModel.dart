import 'dart:convert';

import 'package:http/http.dart' as http;

import 'AlbumModel.dart';

class CallWissApiModel {
  final String url;
  final String method;
  final Map<String, String> headers;
  final Map<String, String> body;

  CallWissApiModel(
      {required this.url,
      required this.method,
      required this.headers,
      required this.body});

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
      throw Exception('Failed to load data');
    }
  }
}
