import 'package:emailApp_flutter/appDrawer.dart';
import 'package:emailApp_flutter/contactListBuilder.dart';
import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/contactSearchDelegate.dart';
import 'package:emailApp_flutter/model/contact.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
          actions: <Widget>[
            StreamBuilder<int>(
              stream: manager.contactCount,
              builder: (context, snapshot) {
                return Chip(
                  label: Text((snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  backgroundColor: Colors.red,
                );
              }
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, 
                delegate: ContactSearchDelegate(manager: manager));
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
        
        // StreamBuilder<List<Contact>>(
        //   stream: manager.contactListView,
        //   builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.none:
        //       case ConnectionState.waiting:
        //       case ConnectionState.active:
        //         return Center(child: CircularProgressIndicator());
        //       case ConnectionState.done:
        //         List<Contact> contacts = snapshot.data;
        //         return ListView.separated(
        //           itemCount: contacts?.length ?? 0,
        //           itemBuilder: (BuildContext context, int index) {
        //             Contact _contact = contacts[index];
        //             return ListTile(
        //               leading: CircleAvatar(),
        //               title: Text(_contact.name),
        //               subtitle: Text(_contact.email),
        //             );
        //           },  
        //           separatorBuilder: (context, index) => Divider(),       
        //         );
        //       default: return Center(child: CircularProgressIndicator());
        //     }
        //   }
        // ),
      ), length: 2,
    );
  }
}
