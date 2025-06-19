//model generated using QuickType

import 'dart:convert';

NewsData newsDataFromJson(String str) => NewsData.fromJson(json.decode(str));

class NewsData {
  String status;
  int totalResults;
  List<Article> articles;

  NewsData({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  String name;

  Source({
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"],
      );
}

enum Id { ABC_NEWS, BUSINESS_INSIDER, THE_VERGE, TIME, USA_TODAY, WIRED }

final idValues = EnumValues({
  "abc-news": Id.ABC_NEWS,
  "business-insider": Id.BUSINESS_INSIDER,
  "the-verge": Id.THE_VERGE,
  "time": Id.TIME,
  "usa-today": Id.USA_TODAY,
  "wired": Id.WIRED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
