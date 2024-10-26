import 'package:news_app_clean_architecture_flutter/core/resources/data_state.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/response/article_response.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // Future<DataState<List<ArticleEntity>>> getNewsArticles();
  Future<DataState<ArticleResponse>> getNewsArticles();

  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
