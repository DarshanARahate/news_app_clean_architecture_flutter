import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/response/article_response.dart';

abstract class RemoteArticlesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  @override
  List<Object> get props => [];
}

class RemoteArticlesDone extends RemoteArticlesState {
  ArticleResponse articleResponse;

  RemoteArticlesDone(this.articleResponse);

  @override
  List<Object?> get props => [articleResponse];
}

class RemoteArticlesError extends RemoteArticlesState {
  DioException? exception;

  RemoteArticlesError(this.exception);

  @override
  List<Object?> get props => [exception];
}
