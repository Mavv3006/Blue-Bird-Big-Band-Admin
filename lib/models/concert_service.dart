import 'package:admin_app/dev_data/mock_concerts.dart';
import 'package:admin_app/logic/models/concert.dart';
import 'package:flutter/material.dart';

class ConcertService extends ChangeNotifier {
  final List<Concert> _concerts = [];

  void addConcert(Concert concert) {
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
