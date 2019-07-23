import 'package:ctvrtkon/src/model/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_network_image/meet_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text(post.title),
            centerTitle: false,
            actions: <Widget>[IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context))],
          ),
          body: _buildContent(post),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _buildContent(Post post) {
    return ListView(
      children: <Widget>[
        MeetNetworkImage(
            height: 210,
            fit: BoxFit.cover,
            imageUrl: post.image,
            loadingBuilder: (context) => SizedBox(
                  height: 210,
                  child: Center(child: CircularProgressIndicator()),
                ),
            errorBuilder: (context, e) => Center(
                  child: Text("Obrázek se nepodařilo nahrát"),
                )),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Icon(Icons.today),
              Text(
                ' ${new DateFormat("dd. MM. y H:ms").format(post.time)}',
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
        _buildCTAButtons(post),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
          child: Text(post.description,
              style: TextStyle(
                fontSize: 15,
              )),
        )
      ],
    );
  }

  Row _buildCTAButtons(Post post) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              label: Text('Mapa'),
              icon: Icon(Icons.map),
              onPressed: () => _launchURL(_getDirectionsUrl(post.place)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              label: Text('Web'),
              icon: Icon(Icons.language),
              onPressed: () => _launchURL(post.url),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(
              label: Text('FB'),
              icon: Icon(Icons.event),
              onPressed: () => _launchURL(post.facebookEvent),
            ),
          ),
        ),
      ],
    );
  }

  String _getDirectionsUrl(String destination) {
    return "https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(destination)}&travelmode=driving&dir_action=navigate";
  }
}
