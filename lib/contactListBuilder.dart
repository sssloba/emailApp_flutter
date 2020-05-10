import 'dart:async';

import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/model/contact.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {

  //final Stream<List<Contact>>stream;
  final Function builder;

  const ContactListBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
     ContactManager manager = Provider.of(context);

    return StreamBuilder<List<Contact>>(
      stream: manager.contactListView,
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;

            return builder(context, contacts);

            // return ListView.separated(
            //   itemCount: contacts?.length ?? 0,
            //   itemBuilder: (BuildContext context, int index) {
            //     Contact _contact = contacts[index];
            //     return ListTile(
            //       leading: CircleAvatar(),
            //       title: Text(_contact.name),
            //       subtitle: Text(_contact.email),
            //     );
            //   },  
            //   separatorBuilder: (context, index) => Divider(),       
            // );
          default: return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}