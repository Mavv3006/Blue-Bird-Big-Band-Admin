import 'dart:developer';

import 'package:admin_app/logic/concert_saving_service.dart';
import 'package:admin_app/logic/models/concert_form_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddingConcertPage extends StatefulWidget {
  const AddingConcertPage({Key? key}) : super(key: key);

  @override
  State<AddingConcertPage> createState() => _AddingConcertPageState();
}

class _AddingConcertPageState extends State<AddingConcertPage> {
  final Map<num, String> bandNameList = {
    1: "Blue Bird Big Band",
    2: "Dometown Band"
  };

  List<DropdownMenuItem<num>> get bandNames {
    List<DropdownMenuItem<num>> result = [];
    bandNameList.forEach((key, value) {
      result.add(
        DropdownMenuItem(
          value: key,
          child: Text(value),
        ),
      );
    });
    return result;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> endTimeKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> startTimeKey = GlobalKey<FormFieldState>();

  var organizerController = TextEditingController();
  var locationController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var streetController = TextEditingController();
  var houseNumberController = TextEditingController();
  var plzController = TextEditingController();
  var placeController = TextEditingController();

  num selectedBand = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konzert hinzufügen"),
      ),
      body: Scrollbar(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: organizerController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Veranstalter / Veranstaltung",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Bitte Text eingeben";
                  }
                  return null;
                },
              ),
              const HelperText("Name des Veranstalters oder der Veranstaltung"),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Beschreibung des Ortes",
                ),
              ),
              const HelperText("Name des Ortes, an dem gespielt wird"),
              const Divider(color: Colors.white),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Datum des Konzerts",
                ),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(3000),
                  );
                  if (date == null) return;
                  dateController.value = TextEditingValue(
                    text: DateFormat("dd.MM.yyyy").format(date),
                  );
                },
              ),
              TextFormField(
                key: startTimeKey,
                controller: startTimeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Uhrzeit von",
                ),
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    helpText: "Uhrzeit von",
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (!mounted) return;
                  BuildContext? currentContext = startTimeKey.currentContext;
                  if (time == null || currentContext == null) return;
                  startTimeController.value = TextEditingValue(
                    text: time.format(currentContext),
                  );
                },
              ),
              const HelperText("Startzeit des Konzerts"),
              TextFormField(
                key: endTimeKey,
                controller: endTimeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Uhrzeit bis",
                ),
                onTap: () async {
                  TimeOfDay? time = await showTimePicker(
                    helpText: "Uhrzeit bis",
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (!mounted) return;
                  BuildContext? currentContext = endTimeKey.currentContext;
                  if (time == null || currentContext == null) return;
                  endTimeController.value = TextEditingValue(
                    text: time.format(currentContext),
                  );
                },
              ),
              const HelperText("Uhrzeit, bis wann das Konzert geht"),
              const Divider(color: Colors.white),
              TextFormField(
                controller: streetController,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Straßenname",
                ),
              ),
              TextFormField(
                controller: houseNumberController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Hausnummer",
                ),
              ),
              TextFormField(
                controller: plzController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "PLZ",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Erforderlich";
                  }
                  int numberInput = int.parse(value);
                  if (numberInput < 10000 || numberInput > 99999) {
                    return "Wert muss zwischen 10000 und 99999 liegen";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: placeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Ort",
                ),
              ),
              const Divider(color: Colors.white),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Welche Band spielt?",
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (!formKey.currentState!.validate()) return;
          saveConcert();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Processing Data"),
            ),
          );
        },
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
    );
  }

  void saveConcert() async {
    ConcertFormDto concertFormDto = ConcertFormDto(
      organizer: organizerController.value,
      locationDescription: locationController.value,
      date: dateController.value,
      startTime: startTimeController.value,
      endTime: endTimeController.value,
      street: streetController.value,
      houseNumber: houseNumberController.value,
      place: placeController.value,
      plz: plzController.value,
      band: {selectedBand: bandNameList[selectedBand]!},
    );

    ConcertSavingService savingService = ConcertSavingService(concertFormDto);
    savingService.transformToConcert();
  }
}

class HelperText extends StatelessWidget {
  const HelperText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
      child: Text(text),
    );
  }
}
