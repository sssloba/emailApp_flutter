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

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Compose new message"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    validator: (value) => !value.contains('@')
                        ? "`TO` field must be a valid email"
                        : null,
                    onSaved: (value) => to = value,
                    decoration: InputDecoration(
                        labelText: 'TO',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    validator: (value) {
                      int len = value.length;
                      if (len == 0) {
                        return "`SUBJECT` cannot be empty";
                      } else if (len <4) {
                        return "`SUBJECT` must be longer than 4 characters";
                      }
                      return null;
                    },
                    onSaved: (value) => subject = value,
                    decoration: InputDecoration(
                        labelText: 'SUBJECT',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                Divider(),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => body = value,
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
                          if (this.key.currentState.validate()) {
                            this.key.currentState.save();

                            Message message = Message(subject, body);

                            Navigator.pop(context, message);
                          }

                          // print(to);
                          // print(subject);
                          // print(body);
                        })),

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
          ),
        ));
  }
}
