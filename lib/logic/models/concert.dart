class Concert {
  Concert(this.date, this.startTime, this.endTime, this.bandName, this.location,
      this.description);

  /// format: yyyy-mm-dd
  String date;

  /// pattern: `\d{2}:\d{2}:\d{2}`
  String startTime;

  /// pattern: `\d{2}:\d{2}:\d{2}`
  String endTime;
  String bandName;
  ConcertLocation location;
  ConcertDescription description;
}

class ConcertDescription {
  ConcertDescription(this.place, this.organizer);

  String place;
  String organizer;
}

class ConcertLocation {
  ConcertLocation(this.street, this.number, this.plz, this.name);

  String street;
  String number;

  /// The postcode of the city the concert takes place.
  ///
  /// range: 10000 to 99999
  num plz;

  /// Name of the city the concert takes place.
  String name;
}
