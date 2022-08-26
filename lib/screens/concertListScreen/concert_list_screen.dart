import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/util/constants.dart';
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
      ),
      body: Column(
        children: [
          sizedBox16,
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, Routes.login),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Login"),
            ),
          ),
          sizedBox16,
          Expanded(
            child: ListView.builder(
              itemCount: concertProvider.concertCount,
              itemBuilder: (context, index) => ConcertWidget(
                concertProvider.all[index],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Concert"),
        icon: const Icon(Icons.add),
        onPressed: () {
          Provider.of<ConcertProvider>(
            context,
            listen: false,
          ).createNewBuilder();
          Navigator.pushNamed(context, Routes.addConcert1);
        },
      ),
    );
  }
}
