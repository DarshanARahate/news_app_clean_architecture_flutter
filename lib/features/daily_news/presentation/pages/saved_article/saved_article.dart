import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/presentation/widget/article_tile.dart';
import 'package:news_app_clean_architecture_flutter/injection_container.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({super.key});

  @override
  Widget build(context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(GetSavedArticles()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title: const Text(
        'Saved Articles',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticlesState>(
        builder: (context, state) {
      if (state is LocalArticlesLoading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is LocalArticlesDone) {
        return _buildArticlesList(state.articles!);
      }
      return Container();
    });
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text('No Saved Articles', style: TextStyle(color: Colors.black)),
      );
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
            article: articles[index],
            isRemovable: true,
            onRemove: (article) => _onRemoveArticle(context, article),
            onArticlePressed: (article) => _onArticlePressed(context, article));
      },
    );
  }

  void _onBackButtonTapped(context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
