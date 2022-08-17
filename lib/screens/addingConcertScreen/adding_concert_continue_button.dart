import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';

class AddingConcertContinueButton extends StatelessWidget {
  AddingConcertContinueButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  final String buttonText;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: AddingConcertColors.backgroundColor,
            primary: AddingConcertColors.darkBlue,
            minimumSize: const Size(175, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
