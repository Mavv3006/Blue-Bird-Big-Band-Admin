import 'package:admin_app/logic/models/concert.dart';
import 'package:admin_app/logic/models/concert_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ConcertService adding one concert', () {
    ConcertService concertService = ConcertService();

    concertService.addConcert(_getMockConcert(DateTime.now()));

    expect(1, concertService.concertCount);
  });
  test('ConcertService adding multiple concerts', () {
    ConcertService concertService = ConcertService();

    concertService.addConcerts([
      _getMockConcert(DateTime.now()),
      _getMockConcert(DateTime.now()),
      _getMockConcert(DateTime.now()),
      _getMockConcert(DateTime.now()),
    ]);

    expect(concertService.concertCount, 4);
  });

  test('ConcertService getting all concerts', () {
    var now = DateTime.now();
    var firstDate = now.subtract(const Duration(hours: 2));
    var secondDate = now.add(const Duration(hours: 2));
    ConcertService concertService = ConcertService();

    concertService.addConcert(
      _getMockConcert(firstDate),
    );
    concertService.addConcert(
      _getMockConcert(secondDate),
    );

    var allConcerts = concertService.all;
    expect(concertService.concertCount, 2);
    expect(allConcerts.length, 2);
    expect(allConcerts[0].date, firstDate);
    expect(allConcerts[1].date, secondDate);
  });

  test('ConcertService getting upcoming concerts', () {
    var now = DateTime.now();
    var firstDate = now.subtract(const Duration(hours: 2));
    var secondDate = now.add(const Duration(hours: 2));
    ConcertService concertService = ConcertService();

    concertService.addConcert(
      _getMockConcert(firstDate),
    );
    concertService.addConcert(
      _getMockConcert(secondDate),
    );

    var upcomingConcerts = concertService.upcoming;
    expect(concertService.concertCount, 2);
    expect(upcomingConcerts.length, 1);
    expect(upcomingConcerts[0].date, secondDate);
  });

  test('ConcertService getting past concerts', () {
    var now = DateTime.now();
    var firstDate = now.subtract(const Duration(hours: 2));
    var secondDate = now.add(const Duration(hours: 2));
    ConcertService concertService = ConcertService();

    concertService.addConcert(
      _getMockConcert(firstDate),
    );
    concertService.addConcert(
      _getMockConcert(secondDate),
    );

    var pastConcerts = concertService.past;
    expect(concertService.concertCount, 2);
    expect(pastConcerts.length, 1);
    expect(pastConcerts[0].date, firstDate);
  });
}

Concert _getMockConcert(DateTime? date) {
  return Concert(
    date ?? DateTime.now(),
    "00:00",
    "02:00",
    "bandName",
    ConcertLocation(
      "street",
      "number",
      12000,
      "name",
    ),
    ConcertDescription(
      "place",
      "organizer",
    ),
  );
}
