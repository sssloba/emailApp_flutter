import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("myemail@email.com"),
              accountName: Text("sssloba"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://avatars3.githubusercontent.com/u/50879837?s=460&u=5c4070300809d0500080c1b490404401f034616c&v=4"
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context :context,
                      builder: (context) {
                        return AlertDialog(title: Text("Adding new account..."),);
                      }
                    );
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text("Inbox"),
              trailing: Chip(
                label: Text("12",
                  style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100],
              ),),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text("Draft"),
              trailing: Chip(
                label: Text("09",
                  style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.blue[100],
              ),),
            ListTile(
              leading: Icon(FontAwesomeIcons.archive),
              title: Text("Archive"),),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text("Sent"),),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text("Trash"),),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
              leading: Icon(FontAwesomeIcons.cog),
              title: Text("Settings"),),
              ),
            )
          ],
        )
      );
  }
}