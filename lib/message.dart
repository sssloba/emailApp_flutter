import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async {
    String url = status == 'important'
        ? 'http://www.mocky.io/v2/5ead97d12f000058001987f1'
        : 'http://www.mocky.io/v2/5ea57baf3200007900ac273e';

    final Uri uri = Uri.http(url);
    http.Response response = await http.get(uri);
    // http.Response response = await http.get(url);

    //await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
