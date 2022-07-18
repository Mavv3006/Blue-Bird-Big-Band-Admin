import 'dart:developer';

import 'package:admin_app/logic/models/concert_form_dto.dart';

import 'models/concert.dart';

class ConcertSavingService {
  ConcertSavingService(this.concertFormDto);

  ConcertFormDto concertFormDto;
  late Concert concert;

  void transformToConcert() {
    List<String> dateComponents = concertFormDto.date.text.split('.');
    DateTime date = DateTime(
      int.parse(dateComponents[2]),
      int.parse(dateComponents[1]),
      int.parse(dateComponents[0]),
    );
    String startTime = concertFormDto.startTime.text;
    String endTime = concertFormDto.endTime.text;
    Map<num, String> band = concertFormDto.band;
    log(band.toString());
    num bandId = band.keys.toList()[0];
    String bandName = band[bandId]!;
    String street = concertFormDto.street.text;
    String number = concertFormDto.houseNumber.text;
    num plz = int.parse(concertFormDto.plz.text);
    String name = concertFormDto.locationDescription.text;
    String place = concertFormDto.place.text;
    String organizer = concertFormDto.organizer.text;

    ConcertLocation location = ConcertLocation(street, number, plz, name);
    ConcertDescription description = ConcertDescription(place, organizer);
    concert = Concert(
      date,
      startTime,
      endTime,
      bandName,
      location,
      description,
    );
    concert.bandId = bandId;

    log(concert.toString());
  }
}
