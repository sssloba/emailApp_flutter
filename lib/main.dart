import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  var messages = const [
    {
      "subject": 'My first message',
      "body": 'Adipisicing officia pariatur eiusmod non enim incididunt adipisicing ullamco dolore eu labore. Aliqua Lorem aliqua ut ullamco do nulla ut velit. Anim do ex eiusmod aliqua laboris ea reprehenderit Lorem exercitation. Aute reprehenderit sunt ut ad deserunt enim.'
    },
    {
      "subject": 'My second message',
      "body": 'OOO Another text which is very very long so every can see it and readed'
    },
    {
      "subject": 'Hello how are you?',
      "body": 'Sit culpa ipsum veniam adipisicing ullamco proident.'
    },
    {
      "subject": 'You should read this message',
      "body": 'Voluptate irure elit aliquip proident reprehenderit eiusmod amet enim quis cillum ad qui nulla est.'
    },
    {
      "subject": 'Yes Ser! I will read it',
      "body": 'Excepteur dolore pariatur minim nisi consequat tempor quis reprehenderit duis ullamco officia.'
    },
  ];

  // var messages = const [
  //   'My first message',
  //   'My second message',
  //   'You won lottery',
  //   'You should read this message',
  //   'You won lottery again'
  // ];
  //var _iconLetters = const ['PJ', 'CA', 'BA', 'DE', 'UK', 'CC'];

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder:(context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message = messages[index];
          //var iconLetters = _iconLetters[index];
          return ListTile(
            title: Text(message["subject"]),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('SS'), //iconLetters
            ),
            subtitle: Text(
              message["body"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
