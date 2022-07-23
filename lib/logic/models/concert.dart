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

  ///  {
  ///    "date": "2022-07-23",
  ///    "start_time": "string",
  ///    "end_time": "string",
  ///    "band_name": "string",
  ///    "location": {
  ///      "street": "string",
  ///      "number": "string",
  ///      "plz": 99999,
  ///      "name": "string"
  ///    }
  ///  }
  factory Concert.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> location = json['location'];
    Map<String, dynamic> descriptions = json['descriptions'];

    return Concert(
      DateTime.parse(json['date'] as String),
      json['start_time'] as String,
      json['end_time'] as String,
      json['band_name'] as String,
      ConcertLocation(
        location['street' as String],
        location['number'] as String,
        location['plz'] as num,
        location['name'] as String,
      ),
      ConcertDescription(
        descriptions['place'] as String,
        descriptions['organizer'] as String,
      ),
    );
  }
}

class ConcertDescription {
  ConcertDescription(this.place, this.organizer);

  String place;
  String organizer;

  @override
  String toString() {
    return "ConcertDescription{place: $place, organizer: $organizer}";
  }
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
}
