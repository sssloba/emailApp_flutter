import 'package:emailApp_flutter/manager/counterManager.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);

    return Center(
      child: StreamBuilder<int>(
        initialData: 0,
        stream: manager.counter$,
        builder: (context, snapshot) {
          return Text("Calendar: ${snapshot.data}");
        },
      ),
    );
  }
}