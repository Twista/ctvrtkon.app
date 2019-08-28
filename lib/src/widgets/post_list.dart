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
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(post: posts[index]))),
            ));
  }

  _withSectionColor(String section) {
    /*
    DEV: #00d674
    MKT: #e77f1a
    UX: #e3006e
    * */
    if (section == "dev") {
      return Color.fromRGBO(0, 214, 116, 1);
    }
    if (section == "mkt") {
      return Color.fromRGBO(231, 127, 26, 1);
    }
    if (section == "ux") {
      return Color.fromRGBO(227, 0, 110, 1);
    }
    if (section == "special") {
      return Colors.yellow;
    }
    return Colors.transparent;
  }

  _buildPost(Post post) {
    return Card(
      color: Colors.white,
      elevation: 0.8,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
          decoration: BoxDecoration(border: Border(left: BorderSide(color: _withSectionColor(post.section), width: 7.0))),
          child: _buildItem(post)),
    );
  }

  _buildItem(Post post) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      title: Text(
        post.fullTitle,
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.today,
              color: Colors.black54,
              size: 15,
            ),
            Text(' ${new DateFormat("dd. MM. y H:ms").format(post.time)}', style: TextStyle(color: Colors.black54))
          ],
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black54, size: 30.0),
    );
  }
}
