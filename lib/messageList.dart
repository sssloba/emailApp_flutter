import 'dart:convert';

import 'package:emailApp_flutter/composeButton.dart';
import 'package:emailApp_flutter/message.dart';
import 'package:emailApp_flutter/messageCompose.dart';
import 'package:emailApp_flutter/messageDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {
  final String title;
  final String status;

  const MessageList({Key key, this.title, this.status = 'important'}) : super(key: key);

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
    future = Message.browse(status: widget.status);
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.blue,
                        icon: Icons.archive,
                        onTap: () => {},
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () => {},
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.black45,
                        icon: Icons.more_horiz,
                        onTap: () => {},
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            messages.removeAt(index);
                          });
                        },
                      ),
                    ],
                    // onDismissed: (direction) {
                    //   setState(() {
                    //     messages.removeAt(index);
                    //   });
                    //   print(direction);
                    // },
                    // background: Container(
                    //   color: Colors.red[300],
                    //   alignment: Alignment.centerRight,
                    //   padding: EdgeInsets.all(16.0),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Icon(
                    //         FontAwesomeIcons.trash,
                    //         color: Colors.white,
                    //       ),
                    //       Padding(padding: EdgeInsets.all(4.0),),
                    //       Text("Delete", style: TextStyle(color: Colors.white),),
                    //     ],
                    //   ),
                    // ),
                    child: ListTile(
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
                    ),
                    key: ObjectKey(message),
                  );
                },
              );
              default: return Center(child: CircularProgressIndicator());
          }
        },
      
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
     //floatingActionButton: ComposeButton(messages),
    );
  }
}