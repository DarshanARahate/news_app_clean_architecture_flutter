import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture_flutter/core/constants/constants.dart';
import 'package:news_app_clean_architecture_flutter/core/resources/data_state.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/response/article_response.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<ArticleResponse>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);
      print("++++ getNewsArticles Success: " +
          httpResponse.response.statusCode.toString());
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse!.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      print("++++ getNewsArticles DioException ${e}");
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
