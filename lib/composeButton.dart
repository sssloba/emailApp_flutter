import 'package:emailApp_flutter/messageCompose.dart';
import 'package:flutter/material.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String intention = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MessageCompose()));
          print(intention);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Your message has been sent with $intention"),
              backgroundColor: Colors.green,
            ),
          );
        });
  }
}
