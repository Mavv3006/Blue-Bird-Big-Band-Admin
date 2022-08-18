import 'package:admin_app/util/constants.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    Key? key,
    required this.controller,
    required this.textStyle,
    required this.labelText,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final TextStyle textStyle;
  final String labelText;
  final FormFieldValidator<String>? validator;

  Color lightenColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  Widget showTimePickerBuilder(BuildContext context, Widget? child) {
    ColorScheme currentColorScheme = Theme.of(context).colorScheme;
    Color lighterDarkBlue = lightenColor(currentColorScheme.onPrimary, 0.125);
    Color? newOnSurface = Colors.grey[800];
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: currentColorScheme.copyWith(
          primary: lighterDarkBlue,
          onPrimary: currentColorScheme.surface,
          onSurface: newOnSurface,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: currentColorScheme.onPrimary,
          ),
        ),
        timePickerTheme: Theme.of(context).timePickerTheme.copyWith(
              dialBackgroundColor: newOnSurface?.withOpacity(0.12),
            ),
      ),
      child: child!,
    );
  }

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  var timeKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: timeKey,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        enabledBorder: darkBlueOutlineInputBorder,
        focusedBorder: darkBlueOutlineInputBorder,
        labelStyle: widget.textStyle,
      ),
      onTap: () async {
        var time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: widget.showTimePickerBuilder,
        );
        if (!mounted) return;
        var currentContext = timeKey.currentContext;
        if (time == null || currentContext == null) return;
        widget.controller.value = TextEditingValue(
          text: time.format(currentContext),
        );
      },
    );
  }
}
