class ArticalModel {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? author;
  final String? publishedAt;
  final String? content;

  ArticalModel({
    required this.content,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.author,
    required this.publishedAt,
  });

  factory ArticalModel.fromJson(Map<String, dynamic> json) {
    return ArticalModel(
      content: json["content"],
      author: json["author"],
      title: json['title'],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: json["publishedAt"],
    );
  }
}
