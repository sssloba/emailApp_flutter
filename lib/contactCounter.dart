import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<int>(
      stream: manager.contactCount,
      builder: (context, snapshot) {
        return Chip(
          label: Text(
            (snapshot.data ?? 0).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
