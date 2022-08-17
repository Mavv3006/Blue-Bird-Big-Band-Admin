import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/util/constants.dart' as constants;

class AddingConcert1Screen extends StatefulWidget {
  const AddingConcert1Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert1Screen> createState() => _AddingConcert1ScreenState();
}

class _AddingConcert1ScreenState extends State<AddingConcert1Screen> {
  num selectedBand = 1;
  late ConcertProvider concertProvider;

  List<DropdownMenuItem<num>> get bandNames {
    List<DropdownMenuItem<num>> result = [];
    constants.bandNames.forEach((key, value) {
      result.add(
        DropdownMenuItem(
          value: key,
          child: Text(value),
        ),
      );
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AddingConcertScaffold(
      appBarTitle: "Band auswählen",
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 64, right: 64, bottom: 8),
                  child: Placeholder(
                    color: AddingConcertColors.darkBlue,
                    fallbackHeight: 300,
                  ),
                ),
                const Text(
                  "Bitte wähle aus, welche Band an \ndem Auftritt spielt.",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 48.0,
                    right: 48.0,
                    top: 32,
                  ),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Welche Band spielt?",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AddingConcertColors.darkBlue),
                      ),
                    ),
                    value: selectedBand,
                    items: bandNames,
                    onChanged: (num? value) {
                      if (value == null) return;
                      setState(() {
                        selectedBand = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          AddingConcertContinueButton(
            buttonText: "Weiter",
            onPressed: () => Navigator.pushNamed(context, Routes.addConcert2),
          ),
        ],
      ),
    );
  }
}
