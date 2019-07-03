import 'dart:convert';

import 'package:ctvrtkon/src/model/post.dart';
import 'package:http/http.dart' as http;

class CtvrtkonAPI {
  static const API_URL = 'https://www.ctvrtkon.cz/feed-1.json';

  Future<List<Post>> fetchPosts() async {
    await new Future.delayed(const Duration(seconds: 1));
    final response = await http.get(API_URL);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List<dynamic> jsonBody =
          json.decode(utf8.decode(response.bodyBytes))['items'];
      return new List.from(
          jsonBody.getRange(0, 8).map((post) => new Post.fromJson(post)));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load posts');
    }
  }
}
