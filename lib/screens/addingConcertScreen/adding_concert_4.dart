import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/screens/addingConcertScreen/image_placeholder.dart';
import 'package:admin_app/screens/addingConcertScreen/text_field.dart';
import 'package:admin_app/util/constants.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';

class AddingConcert4Screen extends StatefulWidget {
  const AddingConcert4Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert4Screen> createState() => _AddingConcert4ScreenState();
}

class _AddingConcert4ScreenState extends State<AddingConcert4Screen> {
  TextEditingController streetController = TextEditingController();
  TextEditingController plzController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AddingConcertScaffold(
      appBarTitle: "Adresse eingeben",
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 64, right: 64, bottom: 8),
                  child: ImagePlaceholder(),
                ),
                const Text(
                  "Bitte gebe ein, an welcher Adresse die Band spielt.",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 48.0,
                    right: 48.0,
                    top: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConcertAddingTextField(
                        labelText: "Straßenname",
                        controller: streetController,
                      ),
                      sizedBox32,
                      ConcertAddingTextField(
                        controller: houseNumberController,
                        labelText: "Hausnummer",
                      ),
                      sizedBox32,
                      ConcertAddingTextField(
                        controller: plzController,
                        labelText: "PLZ",
                        keyboardType: TextInputType.number,
                      ),
                      sizedBox32,
                      ConcertAddingTextField(
                        controller: cityNameController,
                        labelText: "Stadtname",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          AddingConcertContinueButton(
            buttonText: "Speichern",
            onPressed: () => Navigator.popUntil(
              context,
              ModalRoute.withName(
                Routes.index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
