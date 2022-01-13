import 'package:despesas/module/views/home_page.dart';
import 'package:flutter/material.dart';

class Despesas extends StatelessWidget {
  const Despesas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _fcTheme() {
      final ThemeData base = ThemeData.light();
      return base.copyWith(
          colorScheme: base.colorScheme.copyWith(
            primary: Colors.indigo,
            secondary: Colors.blueGrey,
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white),
          ));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas Pessoais',
      home: const HomePage(),
      theme: _fcTheme(),
    );
  }
}
