import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddingConcertScaffold extends StatelessWidget {
  const AddingConcertScaffold({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AddingConcertColors.backgroundColor,
        appBar: AppBar(
          title: const Text(
            "Band auswählen",
            style: TextStyle(
              color: AddingConcertColors.darkBlue,
            ),
          ),
          backgroundColor: AddingConcertColors.lightBlue,
          iconTheme: const IconThemeData(color: AddingConcertColors.darkBlue),
        ),
        body: child);
  }
}
