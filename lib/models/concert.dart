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

  Concert.fromJson(Map<String, dynamic> json)
      : this(
          DateTime.parse(json['date'] as String),
          json['start_time'] as String,
          json['end_time'] as String,
          json['band_name'] as String,
          ConcertLocation.fromJson(json['location']),
          ConcertDescription.fromJson(json['descriptions']),
        );
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

  ConcertDescription.fromJson(Map<String, dynamic> json)
      : this(
          json['place'] as String,
          json['organizer'] as String,
        );
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

  ConcertLocation.fromJson(Map<String, dynamic> json)
      : this(
          json['street'] as String,
          json['number'] as String,
          json['plz'] as int,
          json['name'] as String,
        );
}
