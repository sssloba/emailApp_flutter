import 'package:emailApp_flutter/app.dart';
import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:emailApp_flutter/uglyProvider.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ContactManager>(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.red,
        ),
        home: UglyProvider(child: App()),
        //MessageList(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
