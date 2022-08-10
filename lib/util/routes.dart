import 'dart:io';

import 'package:meta/meta.dart';

@sealed
class Routes {
  Routes._();

  static const String index = '/';
  static const String addConcert = 'addConcert';
}
