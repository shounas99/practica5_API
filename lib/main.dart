import 'package:flutter/material.dart';
import 'package:practica5/screens/comic_screen.dart';

import 'package:practica5/screens/details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'comic',
      routes: {
        'comic'  : ( _ ) => ComicScreen(),
        'details': ( _ ) => DetailsScreen()
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.red
        )
      )
    );
  }
}