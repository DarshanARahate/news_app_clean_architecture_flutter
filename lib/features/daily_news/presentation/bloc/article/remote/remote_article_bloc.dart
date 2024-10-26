import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture_flutter/core/resources/data_state.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.articles!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataSuccess && dataState.data == null) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
