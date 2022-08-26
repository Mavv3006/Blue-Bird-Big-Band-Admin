import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';

const Map<num, String> bandNames = {
  1: "Blue Bird Big Band",
  2: "Dometown Band"
};

const BorderSide darkBlueBorderSide = BorderSide(
  color: AddingConcertColors.darkBlue,
);

const darkBlueOutlineInputBorder = OutlineInputBorder(
  borderSide: darkBlueBorderSide,
);
const sizedBox32 = SizedBox(height: 32);
const sizedBox16 = SizedBox(height: 16);

const String dateFormatPattern = "dd.MM.yyyy";
