import 'package:ctvrtkon/src/model/post.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  _buildContent(Post post) {
    return ListView(
      children: <Widget>[
        Image(
          height: 210,
          fit: BoxFit.cover,
          image: NetworkImage(post.image),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Icon(Icons.today),
              Text(
                ' ${post.time}',
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: <Widget>[
              Icon(Icons.place),
              Expanded(
                child: Text(
                  ' ${post.place}',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton.icon(
                  label: Text('Web'),
                  icon: Icon(Icons.language),
                  onPressed: () => print(post),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton.icon(
                  label: Text('Facebook event'),
                  icon: Icon(Icons.event),
                  onPressed: () => print(post),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Text(post.description),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('${post.image} - ${post.title}');
    return Material(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text(post.title),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  })
            ],
          ),
          body: _buildContent(post),
        ),
      ),
    );
  }

  static Future dialog(Post post, BuildContext ctx) async {
    await showDialog(context: ctx, builder: (context) => PostDetail(post: post));
  }
}
