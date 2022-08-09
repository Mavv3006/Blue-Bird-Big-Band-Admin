import 'package:flutter/material.dart';

class ConcertFormDto {
  ConcertFormDto({
    required this.organizer,
    required this.locationDescription,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.street,
    required this.houseNumber,
    required this.place,
    required this.plz,
    required this.band,
  });

  TextEditingValue organizer;
  TextEditingValue locationDescription;
  TextEditingValue date;
  TextEditingValue startTime;
  TextEditingValue endTime;
  TextEditingValue street;
  TextEditingValue houseNumber;
  TextEditingValue plz;
  TextEditingValue place;
  Map<num, String> band;
}
