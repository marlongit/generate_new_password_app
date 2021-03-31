import 'package:flutter/material.dart';
import 'package:gerador_de_senha/views/generaet_new_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerador de Senhas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GererateNewPassword(),
    );
  }
}
