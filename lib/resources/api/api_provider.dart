import 'package:http/http.dart';

import '../../models/concert.dart';

class ApiProvider {
  final Uri baseUrl = Uri.https('api.bluebirdbigband.de', '/api/');
  Client client = Client();

  Future<List<Concert>> getUpcomingConcerts() async {}

  Future<List<Concert>> getAllConcerts() async {}

  Future<List<Concert>> getPastConcerts() async {}

  Future<void> postNewConcert(Concert concert) async {}
}
