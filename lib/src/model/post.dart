import '../utils.dart';

class Post {
  final String id;
  final String title;
  final String description;
  final String image;
  final String url;
  final String section;
  final String place;
  final String facebookEvent;
  final DateTime time;

  Post({this.id, this.title, this.description, this.image, this.url, this.place, this.section, this.facebookEvent, this.time});

  static const Map<String, String> sectionMap = {
    'dev': '[DEV]',
    'mkt': '[MKT]',
    'ux': '[UX]',
    'special': '[Speciál]',
    'other': '[Jiné]',
  };

  get fullTitle => (sectionMap.containsKey(section) ? '${sectionMap[section]} ' : '') + ' $title';

  @override
  String toString() {
    return 'Post{id: $id, title: $title, description: $description, image: $image, url: $url, section: $section, place: $place, facebookEvent: $facebookEvent, time: $time}';
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      url: json['url'],
      place: json['place'],
      section: json['section'],
      facebookEvent: json['fbEventLink'],
      time: stringToDateTime(json['time']),
    );
  }
}
