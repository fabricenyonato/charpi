import 'package:charpi/presentation/home_page/home_page.dart';
import 'package:charpi/presentation/home_page/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:charpi/di.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts
      .montserratTextTheme(Theme.of(context).textTheme);

    final inputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8)
      )
    );

    const pageTransitionsTheme = PageTransitionsTheme(
      builders: { TargetPlatform.android: ZoomPageTransitionsBuilder() }
    );

    final theme = ThemeData(
      primarySwatch: Colors.purple,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      pageTransitionsTheme: pageTransitionsTheme,
    );

    return MaterialApp(
      title: 'Charpi',
      theme: theme,
      home: HomePage(bloc: getit<HomePageBloc>())
    );
  }
}
