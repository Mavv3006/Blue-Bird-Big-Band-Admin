import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/concert_widget.dart';

class ConcertListScreen extends StatelessWidget {
  const ConcertListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConcertProvider concertProvider = context.watch<ConcertProvider>();

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
        itemCount: concertProvider.concertCount,
        itemBuilder: (context, index) => ConcertWidget(
          concertProvider.all[index],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Concert"),
        icon: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, Routes.addConcert1),
      ),
    );
  }
}
