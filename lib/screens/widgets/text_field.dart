import 'package:admin_app/util/constants.dart';
import 'package:flutter/material.dart';

class MyTexField extends StatelessWidget {
  const MyTexField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        enabledBorder: darkBlueOutlineInputBorder,
        focusedBorder: darkBlueOutlineInputBorder,
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            var themeData = Theme.of(context);
            if (states.contains(MaterialState.error)) {
              var inputTheme = themeData.inputDecorationTheme;
              var mergeTheme =
                  inputTheme.floatingLabelStyle ?? inputTheme.labelStyle;
              return TextStyle(color: themeData.errorColor).merge(mergeTheme);
            }
            return TextStyle(
              color: themeData.colorScheme.onPrimary,
            );
          },
        ),
      ),
    );
  }
}
