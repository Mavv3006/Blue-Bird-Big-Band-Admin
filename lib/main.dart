import 'package:admin_app/logic/models/concert_service.dart';
import 'package:admin_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/addingConcertScreen/adding_concert_screen.dart';
import 'screens/concertListScreen/concert_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        var concertService = ConcertService();
        concertService.initialize();
        return concertService;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: MyColors.darkBlueColor,
            bottomAppBarColor: MyColors.darkBlueColor),
        initialRoute: '/',
        routes: {
          '/': (context) => const ConcertListScreen(),
          '/add-concert': (context) => const AddingConcertScreen()
        },
      ),
    );
  }
}
