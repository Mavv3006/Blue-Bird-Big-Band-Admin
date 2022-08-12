import 'dart:convert';

import 'package:http/http.dart';

import '../../models/concert.dart';
import '../../util/environment.dart';

class ApiProvider {
  static const prodUrl = 'dev.api.bluebirdbigband.de';
  static const devUrl = 'localhost:8000';

  final Uri baseUrl = Uri.https(Environment.isProd ? prodUrl : devUrl, '/api');
  Client client = Client();

  Future<List<Concert>> getUpcomingConcerts() async {
    Uri uri = baseUrl.replace(path: '${baseUrl.path}/concerts/upcoming');
    return await getConcertListRequest(uri);
  }

  Future<List<Concert>> getAllConcerts() async {
    Uri uri = baseUrl.replace(path: '${baseUrl.path}/concerts/all');
    return await getConcertListRequest(uri);
  }

  Future<List<Concert>> getPastConcerts() async {
    Uri uri = baseUrl.replace(path: '${baseUrl.path}/concerts/past');
    return await getConcertListRequest(uri);
  }

  /// Returns the status code of the HTTP request
  Future<num> postNewConcert(Concert concert) async {
    Uri uri = baseUrl.replace(path: '${baseUrl.path}/concert');
    Map<String, dynamic> json = concert.toJson();
    Response response = await client.post(uri, body: json);
    return response.statusCode;
  }

  Future<List<Concert>> getConcertListRequest(Uri uri) async {
    Response response = await client.get(uri);
    var jsonResponse = json.decode(response.body);
    Iterable<Concert> resultList = jsonResponse.map<Concert>(
      (e) => Concert.fromJson(e),
    );
    return resultList.toList();
  }
}
