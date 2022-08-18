import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/screens/addingConcertScreen/image_placeholder.dart';
import 'package:admin_app/screens/addingConcertScreen/text_field.dart';
import 'package:admin_app/util/constants.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

class AddingConcert4Screen extends StatefulWidget {
  const AddingConcert4Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert4Screen> createState() => _AddingConcert4ScreenState();
}

class _AddingConcert4ScreenState extends State<AddingConcert4Screen> {
  final streetController = TextEditingController();
  final plzController = TextEditingController();
  final cityNameController = TextEditingController();
  final houseNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AddingConcertScaffold(
      appBarTitle: "Adresse eingeben",
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
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
                  Form(
                    key: formKey,
                    child: Padding(
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Straßenname eingeben";
                              }
                              return null;
                            },
                          ),
                          sizedBox32,
                          ConcertAddingTextField(
                            controller: houseNumberController,
                            labelText: "Hausnummer",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Hausnummer eingeben";
                              }
                              return null;
                            },
                          ),
                          sizedBox32,
                          ConcertAddingTextField(
                            controller: plzController,
                            labelText: "PLZ",
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Postleitzahl eingeben";
                              }
                              return null;
                            },
                          ),
                          sizedBox32,
                          ConcertAddingTextField(
                            controller: cityNameController,
                            labelText: "Stadtname",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Stadtname eingeben";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          AddingConcertContinueButton(
            buttonText: "Speichern",
            onPressed: saveButton,
          ),
        ],
      ),
    );
  }

  void saveButton() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      final street = streetController.text;
      final houseNumber = houseNumberController.text;
      final plz = int.parse(plzController.text);
      final city = cityNameController.text;
      final provider = Provider.of<ConcertProvider>(context, listen: false);
      final concert =
          provider.builder.addLocation(street, houseNumber, plz, city).build();
      provider.addConcert(concert);
      Navigator.popUntil(context, ModalRoute.withName(Routes.index));
    }
  }
}
