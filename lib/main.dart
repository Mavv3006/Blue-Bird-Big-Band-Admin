import 'package:admin_app/logic/models/concert_service.dart';
import 'package:admin_app/ui/pages/adding_concert_page.dart';
import 'package:admin_app/ui/pages/concert_list_page.dart';
import 'package:admin_app/util/bbbb_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: BBBBColors.darkBlueColor,
          bottomAppBarColor: BBBBColors.darkBlueColor,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ConcertListPage(),
          '/add-concert': (context) => const AddingConcertPage()
        },
      ),
    );
  }
}
