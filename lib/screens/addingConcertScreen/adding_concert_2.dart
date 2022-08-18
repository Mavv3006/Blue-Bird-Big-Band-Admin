import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/screens/addingConcertScreen/image_placeholder.dart';
import 'package:admin_app/screens/addingConcertScreen/text_field.dart';
import 'package:admin_app/util/constants.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddingConcert2Screen extends StatefulWidget {
  const AddingConcert2Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert2Screen> createState() => _AddingConcert2ScreenState();
}

class _AddingConcert2ScreenState extends State<AddingConcert2Screen> {
  TextEditingController organizerController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AddingConcertScaffold(
      appBarTitle: "Beschreibungen eingeben",
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
                    "Bitte beschreibe, den Anlass für den Auftritt\nund wie die Location heißt, an der die Band spielt.",
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
                            controller: locationController,
                            labelText: "Ortsbeschreibung",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Ortsbeschreibung eingeben";
                              }
                              return null;
                            },
                          ),
                          sizedBox32,
                          ConcertAddingTextField(
                            controller: organizerController,
                            labelText: "Veranstaltungsname",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Veranstaltungsname eingeben";
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
            buttonText: "Weiter",
            onPressed: () {
              if (formKey.currentState != null &&
                  formKey.currentState!.validate()) {
                ConcertProvider provider = Provider.of<ConcertProvider>(
                  context,
                  listen: false,
                );
                final String place = locationController.text;
                final String organizer = organizerController.text;
                provider.builder.addDescription(place, organizer);
                Navigator.pushNamed(context, Routes.addConcert3);
              }
            },
          ),
        ],
      ),
    );
  }
}
