import 'package:admin_app/util/constants.dart';
import 'package:flutter/material.dart';

class ConcertAddingTextField extends StatelessWidget {
  const ConcertAddingTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    var onPrimaryColorTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
    );
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        enabledBorder: darkBlueOutlineInputBorder,
        focusedBorder: darkBlueOutlineInputBorder,
        labelStyle: onPrimaryColorTextStyle,
      ),
    );
  }
}