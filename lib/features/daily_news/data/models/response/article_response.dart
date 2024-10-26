import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_clean_architecture_flutter/core/constants/constants.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/entities/article.dart';

part 'article_response.g.dart';

@JsonSerializable(createToJson: false)
class ArticleResponse {
  ArticleResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  static const String statusKey = "status";

  final int? totalResults;
  static const String totalResultsKey = "totalResults";

  final List<Article>? articles;
  static const String articlesKey = "articles";

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  @override
  String toString() {
    return "$status, $totalResults, $articles, ";
  }

  static createArticle(Article entity) {
    return ArticleEntity(
        // id: 0,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage ?? kDefaultImage,
        publishedAt: entity.publishedAt.toString(),
        content: entity.content);
  }

}

@JsonSerializable(createToJson: false)
class Article {
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

  final Source? source;
  static const String sourceKey = "source";

  final String? author;
  static const String authorKey = "author";

  final String? title;
  static const String titleKey = "title";

  final String? description;
  static const String descriptionKey = "description";

  final String? url;
  static const String urlKey = "url";

  final String? urlToImage;
  static const String urlToImageKey = "urlToImage";

  final DateTime? publishedAt;
  static const String publishedAtKey = "publishedAt";

  final String? content;
  static const String contentKey = "content";

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  @override
  String toString() {
    return "$source, $author, $title, $description, $url, $urlToImage, $publishedAt, $content, ";
  }
}

@JsonSerializable(createToJson: false)
class Source {
  Source({
    required this.id,
    required this.name,
  });

  final String? id;
  static const String idKey = "id";

  final String? name;
  static const String nameKey = "name";

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  @override
  String toString() {
    return "$id, $name, ";
  }
}
