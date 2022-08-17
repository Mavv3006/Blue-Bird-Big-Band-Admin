import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';

class AddingConcertScaffold extends StatelessWidget {
  const AddingConcertScaffold(
      {Key? key, required this.child, required this.appBarTitle})
      : super(key: key);

  final Widget child;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AddingConcertColors.backgroundColor,
        appBar: AppBar(
          title: Text(
            appBarTitle,
            style: const TextStyle(
              color: AddingConcertColors.darkBlue,
            ),
          ),
          backgroundColor: AddingConcertColors.lightBlue,
          iconTheme: const IconThemeData(color: AddingConcertColors.darkBlue),
        ),
        body: child);
  }
}
