import 'package:ctvrtkon/src/model/post.dart';
import 'package:ctvrtkon/src/widgets/post_detail.dart';
import 'package:flutter/material.dart';

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

  _buildPost(Post post) {
    return Card(
      elevation: 0.8,
      margin: new EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(5, 144, 188, 1)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            title: Text(
              post.title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.today,
                    color: Colors.white,
                    size: 15,
                  ),
                  Text(' ${post.time}', style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.white, size: 30.0),
          )),
    );
  }

  _buildPost2(Post post) {
    return new ListTile(
      title: Text(post.title),
      subtitle: Row(
        children: <Widget>[
          Padding(
            child: Icon(
              Icons.calendar_today,
              size: 15,
            ),
            padding: EdgeInsets.only(right: 5),
          ),
          Text(post.time),
          Padding(
            child: Icon(
              Icons.place,
              size: 15,
            ),
            padding: EdgeInsets.only(left: 10, right: 5),
          ),
          Expanded(
              child: Text(
            post.place,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
