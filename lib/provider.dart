import 'package:emailApp_flutter/overseer.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {

  final Overseer data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);
 
  static Overseer of(BuildContext context) {
    //final type = _typeOf<Provider<T>>();
    return context.dependOnInheritedWidgetOfExactType<Provider>().data;
  }

  //static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
  
}