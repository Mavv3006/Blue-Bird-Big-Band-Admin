import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/screens/addingConcertScreen/image_placeholder.dart';
import 'package:admin_app/screens/addingConcertScreen/text_field.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/constants.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';

class AddingConcert2Screen extends StatefulWidget {
  const AddingConcert2Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert2Screen> createState() => _AddingConcert2ScreenState();
}

class _AddingConcert2ScreenState extends State<AddingConcert2Screen> {
  TextEditingController organizerController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var onPrimaryColorTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
    );

    return AddingConcertScaffold(
      appBarTitle: "Beschreibungen eingeben",
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
                  "Bitte beschreibe, den Anlass für den Auftritt\nund wie die Location heißt, an der die Band spielt.",
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
                        controller: locationController,
                        labelText: "Ortsbeschreibung",
                      ),
                      sizedBox32,
                      ConcertAddingTextField(
                        controller: organizerController,
                        labelText: "Veranstaltungsname",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          AddingConcertContinueButton(
            buttonText: "Weiter",
            onPressed: () => Navigator.pushNamed(context, Routes.addConcert3),
          ),
        ],
      ),
    );
  }
}
