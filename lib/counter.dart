import 'package:emailApp_flutter/manager/counterManager.dart';
import 'package:emailApp_flutter/observer.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);

    return Center(
      child: Observer<int>(
        stream: manager.counter$,
        onSuccess: (context, data) {
          return Text("Calendar: $data");
        },
      ),
    );
  }
}