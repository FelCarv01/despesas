import 'package:despesas/module/views/home_page.dart';
import 'package:flutter/material.dart';

class Despesas extends StatelessWidget {
  const Despesas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas Pessoais',
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.blueGrey,
        ),
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
