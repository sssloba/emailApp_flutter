import 'dart:convert';

import 'package:emailApp_flutter/composeButton.dart';
import 'package:emailApp_flutter/message.dart';
import 'package:emailApp_flutter/messageCompose.dart';
import 'package:emailApp_flutter/messageDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;

  //Future<List<Message>> messages;
  //bool isLoading = true;

  // Future loadMessageList() async {
  //   List<Message> _messages = await Message.browse();
    
  //   setState(() {
  //     messages = _messages;
  //     //isLoading = false;
  //   });
  // }

  void initState() {
    //loadMessageList();
    super.initState();
    //messages = Message.browse();
    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.refresh), onPressed: () async {
            var _messages = await Message.browse();
            setState(() {
              messages = _messages;
            });
          })
        ]
      ),
      drawer: Drawer(
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
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text("There was an error ${snapshot.error}");
              var messages = snapshot.data;
              return ListView.separated(
                itemCount: messages.length,
                separatorBuilder:(context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  //var iconLetters = _iconLetters[index];
                  return ListTile(
                    title: Text(message.subject),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      child: Text('SS'), //iconLetters
                    ),
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
                       MessageDetail(message.subject, message.body)
                      ));
                    }
                  );
                },
              );
              default: return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // isLoading 
      // ? Center(child: CircularProgressIndicator())
      // : ListView.separated(
      //     itemCount: messages.length,
      //     separatorBuilder:(context, index) => Divider(),
      //     itemBuilder: (BuildContext context, int index) {
      //       Message message = messages[index];
      //       //var iconLetters = _iconLetters[index];
      //       return ListTile(
      //         title: Text(message.subject),
      //         isThreeLine: true,
      //         leading: CircleAvatar(
      //           child: Text('SS'), //iconLetters
      //         ),
      //         subtitle: Text(
      //           message.body,
      //           maxLines: 2,
      //           overflow: TextOverflow.ellipsis,
      //         ),
      //       );
      //     },
      //   ),
     floatingActionButton: ComposeButton(messages),
    );
  }
}