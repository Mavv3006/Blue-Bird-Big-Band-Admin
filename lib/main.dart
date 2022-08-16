import 'package:admin_app/resources/provider/concert_provider.dart';
import 'package:admin_app/screens/addingConcertScreen/adding_concert_1.dart';
import 'package:admin_app/util/colors.dart';
import 'package:admin_app/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/addingConcertScreen/adding_concert_screen.dart';
import 'screens/concertListScreen/concert_list_screen.dart';

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
          primarySwatch: MyColors.darkBlueColor,
          bottomAppBarColor: MyColors.darkBlueColor,
        ),
        initialRoute: Routes.index,
        routes: {
          Routes.index: (context) => const ConcertListScreen(),
          Routes.addConcert1: (context) => const AddingConcert1Screen(),
          // Routes.addConcert2: (context) => const AddingConcertScreen(),
          // Routes.addConcert3: (context) => const AddingConcertScreen(),
        },
      ),
    );
  }
}
