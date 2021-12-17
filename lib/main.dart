import 'package:charpi/presentation/home_page/home_page.dart';
import 'package:charpi/presentation/home_page/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:charpi/di.dart';

void main() {
  initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charpi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(bloc: getit<HomePageBloc>())
    );
  }
}
