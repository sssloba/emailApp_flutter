import 'package:emailApp_flutter/contactListBuilder.dart';
import 'package:emailApp_flutter/contactManager.dart';
import 'package:emailApp_flutter/model/contact.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class ContactSearch extends SearchDelegate {
  final ContactManager manager;

  ContactSearch({this.manager});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    if (query.length < 3) {
      return Center(
        child: Text("Type at least 3 letters to search"),
      );
    }

    return ContactListBuilder(
      //stream: manager.filteredCollection(query: query),
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
      },
    );
    // return StreamBuilder<List<Contact>>(
    //   stream: manager.filteredCollection(query: query),
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
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  
}