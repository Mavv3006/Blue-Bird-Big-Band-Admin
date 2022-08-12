import 'package:admin_app/models/concert.dart';
import 'package:admin_app/resources/api/api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

import 'api_provider_data.dart';

void main() {
  test('get all concerts', () async {
    final ApiProvider client = ApiProvider();
    client.client = MockClient(clientResponse);

    final List<Concert> concerts = await client.getAllConcerts();

    expect(concerts.length, 2);
    final Concert concert = concerts[0];
    expect(concert.date, DateTime(2022, 7, 6));
    expect(concert.startTime, '18:00:00');
    expect(concert.endTime, '22:00:00');
    expect(concert.bandName, 'Blue Bird Big Band');
    final ConcertLocation location = concert.location;
    expect(location.street, "Maxstraße");
    expect(location.number, "33");
    expect(location.plz, 67059);
    expect(location.name, 'Ludwigshafen am Rhein');
    final ConcertDescription description = concert.description;
    expect(description.place, "Lutherturm");
    expect(description.organizer, "Swing im Dreieck");
  });

  test('get past concerts', () async {
    final ApiProvider client = ApiProvider();
    client.client = MockClient(clientResponse);

    final List<Concert> concerts = await client.getPastConcerts();

    expect(concerts.length, 1);
    final Concert concert = concerts[0];
    expect(concert.date, DateTime(2022, 7, 6));
    expect(concert.startTime, '18:00:00');
    expect(concert.endTime, '22:00:00');
    expect(concert.bandName, 'Blue Bird Big Band');
    final ConcertLocation location = concert.location;
    expect(location.street, "Maxstraße");
    expect(location.number, "33");
    expect(location.plz, 67059);
    expect(location.name, 'Ludwigshafen am Rhein');
    final ConcertDescription description = concert.description;
    expect(description.place, "Lutherturm");
    expect(description.organizer, "Swing im Dreieck");
  });

  test('get upcoming concerts', () async {
    final ApiProvider client = ApiProvider();
    client.client = MockClient(clientResponse);

    final List<Concert> concerts = await client.getUpcomingConcerts();

    expect(concerts.length, 1);
    final Concert concert = concerts[0];
    expect(concert.date, DateTime(2022, 8, 21));
    expect(concert.startTime, '11:30:00');
    expect(concert.endTime, '14:30:00');
    expect(concert.bandName, 'Blue Bird Big Band');
    final ConcertLocation location = concert.location;
    expect(location.street, "Straße");
    expect(location.number, "33");
    expect(location.plz, 67346);
    expect(location.name, 'Speyer');
    final ConcertDescription description = concert.description;
    expect(description.place, "Im Rathaushof");
    expect(description.organizer, "Jazz im Rathaushof");
  });
}
