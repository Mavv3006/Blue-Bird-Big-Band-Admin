import 'package:admin_app/resources/api/api_provider.dart';
import 'package:admin_app/resources/database/storage_provider.dart';
import 'package:flutter/material.dart';

import '../../dev_data/mock_concerts.dart';
import '../../models/concert.dart';

class ConcertProvider extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();
  final StorageProvider storageProvider = StorageProvider();
  final List<Concert> _concerts = [];

  void addConcert(Concert concert) {
    apiProvider.postNewConcert(concert);
    _concerts.add(concert);
    notifyListeners();
  }

  void addConcerts(List<Concert> concerts) {
    for (int i = 0; i < concerts.length; i++) {
      addConcert(concerts[i]);
    }
  }

  int get concertCount => _concerts.length;

  List<Concert> get upcoming => _concerts
      .where((element) => DateTime.now().isBefore(element.date))
      .toList();

  List<Concert> get all => _concerts;

  List<Concert> get past => _concerts
      .where((element) => DateTime.now().isAfter(element.date))
      .toList();

  void initialize() {
    addConcerts(mockConcerts);
  }
}
