import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_scaffold.dart';
import 'package:admin_app/screens/addingConcertScreen/image_placeholder.dart';
import 'package:admin_app/screens/addingConcertScreen/time_picker.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/constants.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddingConcert3Screen extends StatefulWidget {
  const AddingConcert3Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert3Screen> createState() => _AddingConcert3ScreenState();
}

class _AddingConcert3ScreenState extends State<AddingConcert3Screen> {
  var dateController = TextEditingController();
  var endTimeController = TextEditingController();
  var startTimeController = TextEditingController();

  var dateKey = GlobalKey<FormFieldState>();

  Widget showDatePickerBuilder(BuildContext context, Widget? child) => Theme(
        data: Theme.of(context).copyWith(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: AddingConcertColors.darkBlue,
            ),
          ),
        ),
        child: child!,
      );

  @override
  Widget build(BuildContext context) {
    var onPrimaryColorTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
    );

    return AddingConcertScaffold(
      appBarTitle: "Datum + Uhrzeit eingeben",
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
                  "Bitte gebe Datum und Uhrzeit des Auftritts ein.",
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
                      TextFormField(
                        key: dateKey,
                        controller: dateController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Datum",
                          enabledBorder: darkBlueOutlineInputBorder,
                          focusedBorder: darkBlueOutlineInputBorder,
                          labelStyle: onPrimaryColorTextStyle,
                        ),
                        onTap: () async {
                          var now = DateTime.now();
                          var date = await showDatePicker(
                            context: context,
                            helpText: "Datum des Konzerts",
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: DateTime(now.year + 10),
                            builder: showDatePickerBuilder,
                          );
                          if (date == null) return;
                          dateController.value = TextEditingValue(
                            text: DateFormat(dateFormatPattern).format(date),
                          );
                        },
                      ),
                      sizedBox32,
                      TimePicker(
                        labelText: "Uhrzeit von",
                        controller: startTimeController,
                        textStyle: onPrimaryColorTextStyle,
                      ),
                      sizedBox32,
                      TimePicker(
                        labelText: "Uhrzeit bis",
                        controller: endTimeController,
                        textStyle: onPrimaryColorTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          AddingConcertContinueButton(
            buttonText: "Weiter",
            onPressed: () => Navigator.pushNamed(context, Routes.addConcert4),
          ),
        ],
      ),
    );
  }
}
