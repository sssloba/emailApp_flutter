import 'package:emailApp_flutter/uglyProvider.dart';
import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = UglyProvider.of(context);
    return FloatingActionButton(
      onPressed: state.increment,
    );
  }
}