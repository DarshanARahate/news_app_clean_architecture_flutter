import 'package:news_app_clean_architecture_flutter/core/resources/data_state.dart';
import 'package:news_app_clean_architecture_flutter/core/usecase/usecase.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/response/article_response.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<ArticleResponse>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<ArticleResponse>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
