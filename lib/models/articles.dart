import 'package:news_app/models/source.dart';

class Articles
{
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlImage;
  String? publishedAt;
  String? content;

  Articles();

  Articles.fromJson(Map<String, dynamic> json)
  {
    this.source = Source.fromJson(json["source"]);
    this.author = json["author"];
    this.title = json["title"];
    this.description = json["description"];
    this.url = json["url"];
    this.urlImage = json["urlToImage"];
    this.publishedAt = json["publishedAt"];
    this.content = json["content"];
  }
}