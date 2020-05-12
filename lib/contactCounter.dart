import 'package:emailApp_flutter/manager/contactManager.dart';
import 'package:emailApp_flutter/observer.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Observer<int>( //StreamBuilder<int>(
      stream: manager.count$,
      onSuccess: (context,data) { 
        return Chip(
          label: Text(
            (data ?? 0).toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        );
      // builder: (context, snapshot) {
      //   return Chip(
      //     label: Text(
      //       (snapshot.data ?? 0).toString(),
      //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //     ),
      //     backgroundColor: Colors.red,
      //   );
      },
    );
  }
}
