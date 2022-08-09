import 'package:intl/intl.dart';

class Concert {
  Concert(this.date, this.startTime, this.endTime, this.bandName, this.location,
      this.description);

  /// format: yyyy-mm-dd
  DateTime date;

  /// pattern: `\d{2}:\d{2}:\d{2}`
  String startTime;

  /// pattern: `\d{2}:\d{2}:\d{2}`
  String endTime;
  String bandName;
  ConcertLocation location;
  ConcertDescription description;
  num? bandId;

  @override
  String toString() {
    return "Concert{date: ${DateFormat('dd.MM.yyyy').format(date)}, startTime: $startTime, endTime: $endTime, bandName: $bandName, bandId?: ${bandId}, location: $location, description: $description}";
  }

  Map<String, dynamic> toJson() => {
        "date": DateFormat("yyyy-MM-dd").format(date),
        "start_time": startTime,
        "end_time": endTime,
        "band_name": bandName,
        "location": location.toJson(),
        "descriptions": description.toJson()
      };
}

class ConcertDescription {
  ConcertDescription(this.place, this.organizer);

  String place;
  String organizer;

  @override
  String toString() {
    return "ConcertDescription{place: $place, organizer: $organizer}";
  }

  Map<String, dynamic> toJson() => {
        'place': place,
        'organizer': organizer,
      };
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

  @override
  String toString() {
    return "ConcertLocation{street: $street, number: $number, plz: $plz, name: $name}";
  }

  Map<String, dynamic> toJson() => {
        "street": street,
        "number": number,
        "plz": plz,
        "name": name,
      };
}
