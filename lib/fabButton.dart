import 'package:emailApp_flutter/manager/counterManager.dart';
import 'package:emailApp_flutter/provider.dart';
import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
 
    return FloatingActionButton(
      onPressed: manager.incremenet
    );
  }
}