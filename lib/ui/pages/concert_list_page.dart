import 'package:admin_app/dev_data/mock_concerts.dart';
import 'package:admin_app/ui/components/concert_component.dart';
import 'package:flutter/material.dart';

class ConcertListPage extends StatelessWidget {
  const ConcertListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konzert Liste"),
      ),
      body: ListView.builder(
        itemCount: mockConcerts.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mockConcerts[index].bandName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              mockConcerts[index].date,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${mockConcerts[index].startTime} Uhr - ${mockConcerts[index].endTime} Uhr | ${mockConcerts[index].description.organizer}",
            ),
            Text(
              "${mockConcerts[index].description.place}, ${mockConcerts[index].location.street} ${mockConcerts[index].location.number}, ${mockConcerts[index].location.plz} ${mockConcerts[index].location.name}",
            )
          ],
        ),
      ),
    );
  }
}
