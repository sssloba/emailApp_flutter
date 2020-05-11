import 'package:emailApp_flutter/appDrawer.dart';
import 'package:emailApp_flutter/contactCounter.dart';
import 'package:emailApp_flutter/contactListBuilder.dart';
import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/contactSearch.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            ContactCounter(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, 
                delegate: ContactSearch());
              }
            ),
            Padding(padding: EdgeInsets.only(right: 16.0),)
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          stream: manager.contactListView,
          builder: (context, contacts) {
            return ListView.separated(
              itemCount: contacts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].email),
                );
              },  
              separatorBuilder: (context, index) => Divider(),       
            );
          }
        ),
      ), length: 2,
    );
  }
}
