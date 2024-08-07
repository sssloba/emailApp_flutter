import 'dart:convert';

import 'package:emailApp_flutter/message.dart';
import 'package:emailApp_flutter/screen/messageDetail.dart';
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class MessageList extends StatefulWidget {
  final String? title;
  final String status;

  const MessageList({Key? key, this.title, this.status = 'important'})
      : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  late Future<List<Message>> future;
  late List<Message> messages;

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
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                Message message = messages[index];
                //var iconLetters = _iconLetters[index];
                return Slidable(
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    extentRatio: 0.25,
                    children: <Widget>[
                      SlidableAction(
                        label: 'Archive',
                        foregroundColor: Colors.blue,
                        icon: Icons.archive,
                        onPressed: null,
                      ),
                      SlidableAction(
                        label: 'Share',
                        foregroundColor: Colors.indigo,
                        icon: Icons.share,
                        onPressed: null,
                      ),
                    ],
                  ),

                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: <Widget>[
                      SlidableAction(
                        label: 'More',
                        foregroundColor: Colors.black45,
                        icon: Icons.more_horiz,
                        onPressed: null,
                      ),
                      SlidableAction(
                        label: 'Delete',
                        foregroundColor: Colors.red,
                        icon: Icons.delete,
                        onPressed: (context) {
                          setState(() {
                            messages.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MessageDetail(
                                        message.subject, message.body)));
                      }),
                  key: ObjectKey(message),
                );
              },
            );
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
