class MeditationModel {
  final String image;
  final String title;
  final String link;
  final String author;

  MeditationModel(
      {required this.image,
      required this.title,
      required this.link,
      required this.author});

  MeditationModel.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        link = json['link'],
        author = json['author'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'image': image,
        'link': link,
        'author': author,
        'title': title,
      };
}

// factory MeditationModel.fromJson(Map<String, dynamic> json) {
//   return MeditationModel(
//       image: json['image'],
//       link: json['link'],
//       author: json['author'],
//       title: json['title']);
// }
