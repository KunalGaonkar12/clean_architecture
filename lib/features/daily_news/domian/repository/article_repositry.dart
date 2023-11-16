import 'package:clean_architecture/features/daily_news/domian/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository{

  //Api Method
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  //Database method
Future<List<ArticleEntity>> getSavedArticles();
Future<void> saveArticle(ArticleEntity article);
Future<void> removeArticle(ArticleEntity article);


}