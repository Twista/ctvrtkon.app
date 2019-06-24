import 'package:ctvrtkon/src/model/post.dart';
import 'package:ctvrtkon/src/services/ctvrtkon_api.dart';
import 'package:flutter/material.dart';

enum PostsState { EMPTY, LOADING, LOADED }

class PostCollection with ChangeNotifier {
  List<Post> _posts = [];
  PostsState _state = PostsState.EMPTY;

  List<Post> get posts => _posts;
  get isLoaded => _state == PostsState.LOADED;

  set posts(List<Post> posts) {
    this._posts = posts;
    notifyListeners();
  }

  loadPosts() async {
    this._state = PostsState.LOADING;
    notifyListeners();
    CtvrtkonAPI api = CtvrtkonAPI();
    posts = await api.fetchPosts();
    this._state = PostsState.LOADED;
    this.posts = posts;
  }
}
