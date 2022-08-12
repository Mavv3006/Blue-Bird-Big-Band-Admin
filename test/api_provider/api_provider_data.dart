import 'dart:convert';

import 'package:admin_app/resources/api/api_provider.dart';
import 'package:http/http.dart';

List<Map<String, dynamic>> pastConcerts = [
  {
    'date': "2022-07-06",
    'start_time': '18:00:00',
    'end_time': "22:00:00",
    'band_name': "Blue Bird Big Band",
    'location': {
      'street': "Maxstraße",
      "number": '33',
      'plz': 67059,
      'name': 'Ludwigshafen am Rhein'
    },
    'descriptions': {
      'place': 'Lutherturm',
      'organizer': "Swing im Dreieck",
    }
  }
];
List<Map<String, dynamic>> upcomingConcerts = [
  {
    'date': "2022-08-21",
    'start_time': '11:30:00',
    'end_time': "14:30:00",
    'band_name': "Blue Bird Big Band",
    'location': {
      'street': "Straße",
      "number": '33',
      'plz': 67346,
      'name': 'Speyer'
    },
    'descriptions': {
      'place': 'Im Rathaushof',
      'organizer': "Jazz im Rathaushof"
    },
  }
];
List<Map<String, dynamic>> allConcerts = pastConcerts + upcomingConcerts;

Future<Response> clientResponse(Request request) {
  final client = ApiProvider();

  if (request.url
      .toString()
      .startsWith('${client.baseUrl}/concerts/upcoming')) {
    return Future.value(Response(json.encode(upcomingConcerts), 200));
  }

  if (request.url.toString().startsWith('${client.baseUrl}/concerts/all')) {
    return Future.value(Response(json.encode(allConcerts), 200));
  }

  if (request.url.toString().startsWith('${client.baseUrl}/concerts/past')) {
    return Future.value(Response(json.encode(pastConcerts), 200));
  }

  if (request.url.toString().startsWith('${client.baseUrl}/concert')) {
    return Future.value(Response('', 404));
  }

  return Future.value(Response('', 404));
}
