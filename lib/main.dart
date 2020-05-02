import 'package:emailApp_flutter/app.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.red,
      ),
      home: App(),
      //MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}
