import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/screens/addingConcertScreen/image_placeholder.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/util/constants.dart' as constants;
import 'package:provider/provider.dart';

class AddingConcert1Screen extends StatefulWidget {
  const AddingConcert1Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert1Screen> createState() => _AddingConcert1ScreenState();
}

class _AddingConcert1ScreenState extends State<AddingConcert1Screen> {
  num selectedBand = 1;
  final formKey = GlobalKey<FormState>();

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
    final ConcertProvider provider =
        Provider.of<ConcertProvider>(context, listen: false);

    return AddingConcertScaffold(
      appBarTitle: "Band auswählen",
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
                    "Bitte wähle aus, welche Band an \ndem Auftritt spielt.",
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 48.0,
                      right: 48.0,
                      top: 32,
                    ),
                    child: Form(
                      key: formKey,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Welche Band spielt?",
                          enabledBorder: constants.darkBlueOutlineInputBorder,
                          focusedBorder: constants.darkBlueOutlineInputBorder,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
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
                  ),
                ],
              ),
            ),
          ),
          AddingConcertContinueButton(
            buttonText: "Weiter",
            onPressed: () {
              if (!constants.bandNames.containsKey(selectedBand)) {
                throw ArgumentError.value(selectedBand, "selectedBand index",
                    "The selected band index does not point to a known band. Allowed values are in range [1 ... 2].");
              }
              String bandName = constants.bandNames[selectedBand]!;
              provider.builder.addBand(bandName);
              Navigator.pushNamed(context, Routes.addConcert2);
            },
          ),
        ],
      ),
    );
  }
}
