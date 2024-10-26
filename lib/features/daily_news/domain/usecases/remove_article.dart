import 'package:news_app_clean_architecture_flutter/core/usecase/usecase.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/repository/article_repository.dart';

class RemovedArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemovedArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
