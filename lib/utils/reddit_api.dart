import 'dart:async';
import 'dart:convert';

import 'package:ouija_quiz_game/utils/models/reddit.dart';
import 'package:ouija_quiz_game/utils/models/serializers.dart';

import 'package:http/http.dart' as http;

final baseUrl = 'https://www.reddit.com/r/AskOuija/hot.json?limit=75';

Future<List<Post>> getOuijaQandA() async {
  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    Reddit reddit = serializers.deserializeWith(
        Reddit.serializer, json.decode(response.body));
    return reddit.data.children.map((Data data) => data.data).toList();
  } else {
    throw UnimplementedError();
  }
}
