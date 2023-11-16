
import 'dart:io';

import 'package:clean_architecture/features/daily_news/domian/entities/article.dart';
import 'package:dio/dio.dart';

import 'package:clean_architecture/core/constants/constaints.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/models/artcile.dart';
import 'package:clean_architecture/features/daily_news/domian/repository/article_repositry.dart';

import '../data_sources/local/app_database.dart';


class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<Article>>> getNewsArticles() async {
    try{
      final httpResponse= await _newsApiService.getNewsArticles(apiKey: newsAPIKey,category:categoryQuery ,country: countryQuery);

      if(httpResponse.response.statusCode==HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      }else{
        return DataFailed(DioException(
            error:httpResponse.response.statusMessage ,response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions:httpResponse.response.requestOptions
        ));
      }
    }on DioException catch(error){
      return DataFailed(error);
    }

  }

  @override
  Future<List<Article>> getSavedArticles()async {
   return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.insertArticle(Article.fromEntity(article));
  }


  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.deleteArticle(Article.fromEntity(article));
  }



}