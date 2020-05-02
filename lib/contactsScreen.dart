import 'package:emailApp_flutter/appDrawer.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts"),),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Contacts"),
      ),
    );
  }
}
