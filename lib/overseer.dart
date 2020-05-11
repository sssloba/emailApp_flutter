import 'package:emailApp_flutter/manager/contactManager.dart';
import 'package:emailApp_flutter/manager/counterManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}