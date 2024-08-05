import 'package:emailApp_flutter/inboxScreen.dart';
import 'package:emailApp_flutter/screen/calendarScreen.dart';
import 'package:emailApp_flutter/screen/contactsScreen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactsScreen(),
        CalendarScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Inbox",
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: "Contacts",
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            label: "Calendar",
            icon: Icon(Icons.calendar_today),
          ),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
