import 'package:emailApp_flutter/app.dart';
import 'package:emailApp_flutter/overseer.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.red,
        ),
        home: App(),
        //UglyProvider(child: App()),
      ),
    );
  }
}
