import 'package:admin_app/logic/models/concert.dart';
import 'package:flutter/material.dart';

class ConcertComponent extends StatelessWidget {
  const ConcertComponent(this.concert, {Key? key}) : super(key: key);

  final Concert concert;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.concert.bandName),
    );
  }
}
