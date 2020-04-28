import 'package:emailApp_flutter/message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Compose new message"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    to = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'TO',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    subject = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'SUBJECT',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Divider(),
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    body =value;
                  },
                  decoration: InputDecoration(
                      labelText: 'BODY',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  maxLines: 9,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text('SEND'),
                  onPressed: () {
                    Message message = Message(subject, body);

                    Navigator.pop(context, message);
                    // print(to);
                    // print(subject);
                    // print(body);
                })
              ),

              // Text("Compose new message",
              //   style: Theme.of(context).textTheme.title),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     RaisedButton(
              //       child: Text("Love"),
              //       onPressed: () {
              //         Navigator.pop(context, "Love");
              //       },
              //     ),
              //     RaisedButton(
              //       child: Text("Hate"),
              //       onPressed: () {
              //         Navigator.pop(context, "Hate");
              //       },
              //     ),
              //],),
            ],
          ),
        ));
  }
}
