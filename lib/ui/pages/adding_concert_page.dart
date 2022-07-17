import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddingConcertPage extends StatefulWidget {
  const AddingConcertPage({Key? key}) : super(key: key);

  @override
  State<AddingConcertPage> createState() => _AddingConcertPageState();
}

class _AddingConcertPageState extends State<AddingConcertPage> {
  final List<DropdownMenuItem<num>> bandNames = [
    const DropdownMenuItem(value: 1, child: Text("Blue Bird Big Band")),
    const DropdownMenuItem(value: 2, child: Text("Dometown Band"))
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  num selectedBand = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konzert hinzufügen"),
      ),
      body: Scrollbar(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
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
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Beschreibung des Ortes"),
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
                  if (time == null) return;
                  startTimeController.value = TextEditingValue(
                    text: "${time.hour}:${time.minute}",
                  );
                },
              ),
              const HelperText("Startzeit des Konzerts"),
              TextFormField(
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
                  if (time == null) return;
                  endTimeController.value = TextEditingValue(
                    text: "${time.hour}:${time.minute}",
                  );
                },
              ),
              const HelperText("Uhrzeit, bis wann das Konzert geht"),
              const Divider(color: Colors.white),
              TextFormField(
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Straßenname",
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Hausnummer",
                ),
              ),
              TextFormField(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Processing Data"),
              ),
            );
          }
          log(_formKey.currentState!.toStringShort());
        },
        child: const Icon(Icons.save),
      ),
    );
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
