import 'package:ctvrtkon/src/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/post_collection.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsCollection = Provider.of<PostCollection>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 124, 163, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        title: Text('Čtvrtkon', style: TextStyle(fontFamily: 'Siruca', fontWeight: FontWeight.w400, fontSize: 35)),
      ),
      body: Container(
        child: !postsCollection.isLoaded
            ? _buildPostLoadingWidget()
            : new Container(
                child: new Center(
                  child: RefreshIndicator(
                    child: PostList(posts: postsCollection.posts),
                    onRefresh: () => postsCollection.loadPosts(),
                  ),
                ),
              ),
      ),
    );
  }

  _buildPostLoadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Column(
          children: <Widget>[
            CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Nahrávám...',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ))
      ],
    );
  }
}
