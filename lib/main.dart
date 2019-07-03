import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/home_screen.dart';
import 'src/model/post_collection.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) {
        PostCollection postCollection = PostCollection();
        postCollection.loadPosts();
        return postCollection;
      },
      child: MaterialApp(
          title: 'Čtvrtkon',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
            primaryColor: Color.fromRGBO(0, 124, 163, 1.0),
          ),
          home: HomeScreen()),
    );
  }
}
