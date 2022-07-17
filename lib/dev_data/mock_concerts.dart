import 'package:admin_app/logic/models/concert.dart';

List<Concert> mockConcerts = [
  Concert(
      DateTime.parse("2022-07-16"),
      "18:00:00",
      "22:00:00",
      "Blue Bird Big Band",
      ConcertLocation("Maxstraße", "33", 67059, "Ludwigshafen am Rhein"),
      ConcertDescription("Lutherturm", "Swing im Dreieck")),
  Concert(
      DateTime.parse("2022-08-21"),
      "11:30:00",
      "14:30:00",
      "Blue Bird Big Band",
      ConcertLocation("???", "???", 67346, "Speyer"),
      ConcertDescription("Im Rathaushof", "Jazz im Rathaushof"))
];
