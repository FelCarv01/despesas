import 'package:despesas/module/views/home_page.dart';
import 'package:flutter/material.dart';

class Despesas extends StatelessWidget {
  const Despesas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas Pessoais',
      home: HomePage(),
    );
  }
}
