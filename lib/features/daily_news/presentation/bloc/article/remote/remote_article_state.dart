import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/response/article_response.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/entities/article.dart';

//
// abstract class RemoteArticlesState extends Equatable {
//   final List<ArticleEntity>? articles;
//   final DioException? exception;
//
//   RemoteArticlesState({this.articles, this.exception});
//
//   @override
//   List<Object> get props => [articles!, exception!];
// }
//
// class RemoteArticlesLoading extends RemoteArticlesState {
//   const RemoteArticlesLoading();
// }
//
// class RemoteArticlesDone extends RemoteArticlesState {
//   const RemoteArticlesDone(List<ArticleEntity> article)
//       : super(articles: article);
// }
//
// class RemoteArticlesError extends RemoteArticlesState {
//   const RemoteArticlesError(DioException exception)
//       : super(exception: exception);
// }

abstract class RemoteArticlesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  @override
  List<Object> get props => [];
}

class RemoteArticlesDone extends RemoteArticlesState {
  // List<ArticleEntity>? articles;
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
