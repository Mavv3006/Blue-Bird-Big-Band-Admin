import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_continue_button.dart';
import 'package:admin_app/screens/widgets/image_placeholder.dart';
import 'package:admin_app/screens/addingConcertScreen/time_picker.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/constants.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddingConcert3Screen extends StatefulWidget {
  const AddingConcert3Screen({Key? key}) : super(key: key);

  @override
  State<AddingConcert3Screen> createState() => _AddingConcert3ScreenState();
}

class _AddingConcert3ScreenState extends State<AddingConcert3Screen> {
  final dateController = TextEditingController();
  final endTimeController = TextEditingController();
  final startTimeController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final dateKey = GlobalKey<FormFieldState>();

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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Datum + Uhrzeit eingeben",
        ),
      ),
      body: Stack(
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
                    "Bitte gebe Datum und Uhrzeit des Auftritts ein.",
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
                          TextFormField(
                            key: dateKey,
                            controller: dateController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Auftrittsdatum eingeben";
                              }
                              return null;
                            },
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
                                text:
                                    DateFormat(dateFormatPattern).format(date),
                              );
                            },
                          ),
                          sizedBox32,
                          TimePicker(
                            labelText: "Uhrzeit von",
                            controller: startTimeController,
                            textStyle: onPrimaryColorTextStyle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Uhrzeit eingeben";
                              }
                              return null;
                            },
                          ),
                          sizedBox32,
                          TimePicker(
                            labelText: "Uhrzeit bis",
                            controller: endTimeController,
                            textStyle: onPrimaryColorTextStyle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Bitte Uhrzeit eingeben";
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
            onPressed: continueButton,
          ),
        ],
      ),
    );
  }

  void continueButton() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      DateTime date = DateFormat(dateFormatPattern).parse(dateController.text);
      String startTime = startTimeController.text;
      String endTime = endTimeController.text;
      Provider.of<ConcertProvider>(context, listen: false)
          .builder
          .addDateAndTime(
            date,
            startTime,
            endTime,
          );
      Navigator.pushNamed(context, Routes.addConcert4);
    }
  }
}
