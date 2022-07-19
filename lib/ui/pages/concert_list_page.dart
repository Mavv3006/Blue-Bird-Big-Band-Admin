import 'package:admin_app/logic/models/concert_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/concert_widget.dart';

class ConcertListPage extends StatelessWidget {
  const ConcertListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConcertService concertService = context.watch<ConcertService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konzert Liste"),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: concertService.concertCount,
        itemBuilder: (context, index) => ConcertWidget(
          concertService.all[index],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Concert"),
        icon: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/add-concert'),
      ),
    );
  }
}
