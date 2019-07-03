import 'package:ctvrtkon/src/model/post.dart';
import 'package:ctvrtkon/src/widgets/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  PostList({this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (ctx, index) => GestureDetector(
              child: _buildPost(posts[index]),
              onTap: () => PostDetail.dialog(posts[index], ctx),
            ));
  }

  _markCurrent(Post post) {
    // todo: distinguish between old and up-to-date ones
    return _buildItem(post);
  }

  _withSectionColor(String section) {
    // todo: better colors & handle
    if (section == "dev") {
      return Colors.white70;
    }
    if (section == "mkt") {
      return Colors.redAccent;
    }
    if (section == "ux") {
      return Colors.greenAccent;
    }
    return Colors.transparent;
  }

  _buildPost(Post post) {
    return Card(
      elevation: 0.8,
      margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
          decoration: BoxDecoration(
              border: Border(left: BorderSide(color: _withSectionColor(post.section), width: 5.0)), color: Color.fromRGBO(5, 144, 188, 1)),
          child: _markCurrent(post)),
    );
  }

  _buildItem(Post post) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      title: Text(
        post.fullTitle,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.today,
              color: Colors.white,
              size: 15,
            ),
            Text(' ${new DateFormat("dd. MM. y H:ms").format(post.time)}', style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      trailing: Icon(Icons.info_outline, color: Colors.white, size: 30.0),
    );
  }
}
