

import 'dart:async';
import 'package:sqflite_common/sqlite_api.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/data_sources/local/dao/article_dao.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/article.dart';
part 'app_database.g.dart';


@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}