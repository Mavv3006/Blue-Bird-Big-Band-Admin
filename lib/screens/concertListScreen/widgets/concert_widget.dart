import 'package:admin_app/models/concert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConcertWidget extends StatelessWidget {
  const ConcertWidget(
    this.concert, {
    Key? key,
  }) : super(key: key);

  final Concert concert;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                concert.bandName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                DateFormat("dd.MM.yyyy").format(concert.date),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${concert.startTime.substring(0, 5)} Uhr - ${concert.endTime.substring(0, 5)} Uhr | ${concert.description.organizer}",
              ),
              Text(
                "${concert.description.place}, ${concert.location.street} ${concert.location.number}, ${concert.location.plz} ${concert.location.name}",
              )
            ],
          ),
        ),
      ),
    );
  }
}
