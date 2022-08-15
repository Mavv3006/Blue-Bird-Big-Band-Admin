import 'package:admin_app/models/concert.dart';

class ConcertBuilder {
  late String bandName;
  late ConcertDescription description;
  late DateTime date;
  late String startTime;
  late String endTime;
  late ConcertLocation location;

  ConcertBuilder addBand(String bandName) {
    this.bandName = bandName;
    return this;
  }

  ConcertBuilder addDescription(String place, String organizer) {
    description = ConcertDescription(place, organizer);
    return this;
  }

  ConcertBuilder addDateAndTime(
    DateTime date,
    String startTime,
    String endTime,
  ) {
    this.date = date;
    this.startTime = startTime;
    this.endTime = endTime;
    return this;
  }

  ConcertBuilder addLocation(
    String street,
    String number,
    num plz,
    String name,
  ) {
    location = ConcertLocation(street, number, plz, name);
    return this;
  }

  Concert build() {
    return Concert(date, startTime, endTime, bandName, location, description);
  }
}
