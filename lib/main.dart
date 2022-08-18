import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_1.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_2.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_3.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_4.dart';
import 'package:admin_app/screens/concertListScreen/concert_list_screen.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConcertProvider>(
      create: (BuildContext context) {
        var concertProvider = ConcertProvider();
        concertProvider.initialize();
        return concertProvider;
      },
      child: MaterialApp(
        title: 'BBBB Admin',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: AddingConcertColors.lightBlue,
            onPrimary: AddingConcertColors.darkBlue,
            secondary: Colors.amber,
            onSecondary: Colors.black87,
            error: Colors.redAccent,
            onError: Colors.black87,
            background: AddingConcertColors.backgroundColor,
            onBackground: Colors.black,
            surface: Colors.white,
            onSurface: Colors.black87,
          ),
        ),
        initialRoute: Routes.index,
        routes: {
          Routes.index: (context) => const ConcertListScreen(),
          Routes.addConcert1: (context) => const AddingConcert1Screen(),
          Routes.addConcert2: (context) => const AddingConcert2Screen(),
          Routes.addConcert3: (context) => const AddingConcert3Screen(),
          Routes.addConcert4: (context) => const AddingConcert4Screen(),
        },
        supportedLocales: const [Locale('de', 'DE')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
