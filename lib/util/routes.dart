import 'dart:io';

import 'package:meta/meta.dart';

@sealed
class Routes {
  Routes._();

  static const String index = '/';
  static const String addConcert1 = 'addConcert1';
  static const String addConcert2 = 'addConcert2';
  static const String addConcert3 = 'addConcert3';
  static const String addConcert4 = 'addConcert4';
}
