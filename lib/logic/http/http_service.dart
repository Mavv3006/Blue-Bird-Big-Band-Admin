import 'dart:convert';

import '../models/concert.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final Uri url = Uri.parse("uri");

  static Future<List<Concert>> getConcerts() async {
    var res = await http.get(url);

    if (res.statusCode != 200) {
      throw "Unable to retrieve concerts.";
    }

    List<dynamic> body = jsonDecode(res.body);

    return body.map((dynamic item) => Concert.fromJson(item)).toList();
  }
}
