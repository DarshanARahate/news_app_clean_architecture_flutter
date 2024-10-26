import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_architecture_flutter/features/daily_news/data/models/response/article_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

//https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
//   https://newsapi.org/v2/top-headlines/sources?apiKey=3e151ebe21b74461b8863ff7c09ffc59
  @GET('/top-headlines')
  // Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
  Future<HttpResponse<ArticleResponse>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
