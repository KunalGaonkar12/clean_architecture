

import 'package:clean_architecture/core/constants/constaints.dart';
import 'package:clean_architecture/features/daily_news/data/models/artcile.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';


@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService{
  factory NewsApiService(Dio dio)=_NewsApiService;
  
  @GET("/top-headlines")
  Future<HttpResponse<List<Article>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
});

}