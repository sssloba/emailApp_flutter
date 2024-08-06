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
        ? 'https://run.mocky.io/v3/10691c20-4bcd-4c14-9590-05df52210417'
        : 'https://run.mocky.io/v3/fb8973db-4f87-45ed-a5c5-de2759386b94';

    final Uri uri = Uri.parse(url);
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
