class Post {
  final String id;
  final String title;
  final String description;
  final String image;
  final String url;
  final String place;
  final String facebookEvent;
  final String time; // todo format

  Post(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.url,
      this.place,
      this.facebookEvent,
      this.time});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      url: json['url'],
      place: json['place'],
      facebookEvent: json['facebookEvent'],
      time: json['time'],
    );
  }
}
