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
  List<Message> messages = const [];

  Future loadMessageList() async {
    http.Response response = await http.get('http://www.mocky.io/v2/5ea57baf3200007900ac273e');
    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList();
    
    setState(() {
      messages = _messages;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
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
      ),
    );
  }
}