import 'package:emailApp_flutter/appDrawer.dart';
import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/model/contact.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            Chip(
              label: StreamBuilder<int>(
                stream: manager.contactCount,
                builder: (context, snapshot) {
                  return Text((snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  );
                }
              ),
              backgroundColor: Colors.red,
            ),
            Padding(padding: EdgeInsets.only(right: 16.0),)
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<List<Contact>>(
          stream: manager.contactListView,
          builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                List<Contact> contacts = snapshot.data;
                return ListView.separated(
                  itemCount: contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact _contact = contacts[index];
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(_contact.name),
                      subtitle: Text(_contact.email),
                    );
                  },  
                  separatorBuilder: (context, index) => Divider(),       
                );
              default: return Center(child: CircularProgressIndicator());
            }
          }
        ),
      ), length: 2,
    );
  }
}
