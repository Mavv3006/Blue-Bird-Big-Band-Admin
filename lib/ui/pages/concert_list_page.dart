import 'package:admin_app/dev_data/mock_concerts.dart';
import 'package:flutter/material.dart';

import '../components/concert_widget.dart';

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
        itemBuilder: (context, index) => ConcertWidget(mockConcerts[index]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Concert"),
        icon: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/add-concert'),
      ),
    );
  }
}
