import 'dart:convert';

import 'package:emailApp_flutter/message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;
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
    
    messages = Message.browse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            var _messages = Message.browse();

            setState(() {
              messages = _messages;
            });
          })
        ]
      ),
      body: FutureBuilder(
        future: messages,
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
                  );
                },
              );
          }
        },
      )
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
    );
  }
}