import 'package:admin_app/models/concert.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test("Convert ConcertDescription to JSON", () {
    var description = ConcertDescription("place", "organizer");

    var json = description.toJson();

    expect({"place": "place", "organizer": "organizer"}, json);
  });

  test("Convert ConcertLocation to JSON", () {
    var location = ConcertLocation("street", "number", 12345, "name");

    var json = location.toJson();

    expect({
      "street": "street",
      "number": "number",
      "plz": 12345,
      "name": "name",
    }, json);
  });

  test("Convert Concert to JSON", () {
    var description = ConcertDescription("place", "organizer");
    var location = ConcertLocation("street", "number", 12345, "name");
    var date = DateTime.now();
    var concert = Concert(
      date,
      "startTime",
      "endTime",
      "bandName",
      location,
      description,
    );

    var json = concert.toJson();

    expect({
      "date": DateFormat("yyyy-MM-dd").format(date),
      "start_time": "startTime",
      "end_time": "endTime",
      "band_name": "bandName",
      "location": location.toJson(),
      "descriptions": description.toJson()
    }, json);
  });
}
