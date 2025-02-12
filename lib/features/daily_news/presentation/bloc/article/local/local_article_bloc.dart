import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticlesUseCase;
  final SavedArticleUseCase _saveArticleUseCase;
  final RemovedArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticlesUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSavedArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSavedArticle(
      SaveArticle saveArticle, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }
}
