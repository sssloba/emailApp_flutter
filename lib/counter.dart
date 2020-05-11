import 'package:emailApp_flutter/uglyProvider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = UglyProvider.of(context, subscribe: false);
    var counter = state.counter;
    return Center(
      child: Text("Calendar: $counter"),
    );
  }
}