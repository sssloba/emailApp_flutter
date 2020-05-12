import 'dart:async';

import 'package:emailApp_flutter/model/contact.dart';
import 'package:emailApp_flutter/service/contactService.dart';
import 'package:rxdart/rxdart.dart';

//List<String> CONTACTS = ["User 1", "User 2", "User 3", "User 4"];

class ContactManager {

  // Stream<List<String>> get contactListNow async* {
  //   for (var i = 0; i < CONTACTS.length; i++) {
  //     await Future.delayed(Duration(seconds: 2));
  //     yield CONTACTS.sublist(0, i + 1);
  //   }
  // }

  // final StreamController<int> _contactCounter = StreamController<int>();
  // Stream<int> get contactCounter => _contactCounter.stream;

  // ContactManager() {
  //   contactListNow.listen((list) => _contactCounter.add(list.length));
  // }

  //final StreamController<int> _contactCount = StreamController<int>();
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;
  Stream<List<Contact>> get browse$ =>_collectionSubject.stream;
  
  // Stream<List<Contact>> get contactListView async* {
  //   yield await ContactService.browse();
  // }
  // Stream<List<Contact>> get contactListView =>
  //   Stream.fromFuture(ContactService.browse());

  // Stream<List<Contact>> browse$({String filter}) =>
  //   Stream.fromFuture(ContactService.browse(filter: filter));
  

  ContactManager() {
    _filterSubject.stream.listen((filter) async {
      var contacts = await ContactService.browse(filter: filter);

      _collectionSubject.add(contacts);
    });
    //contactListView.listen((list) => _contactCount.add(list.length));
    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}