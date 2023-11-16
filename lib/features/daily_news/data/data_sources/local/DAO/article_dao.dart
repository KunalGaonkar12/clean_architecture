import 'package:floor/floor.dart';

import '../../../models/artcile.dart';

@dao
abstract class ArticleDao{

  @insert
  Future<void> insertArticle(Article article);
  
  @delete
  Future<void> deleteArticle(Article article);
  
  @Query('SELECT * FROM article')
  Future<List<Article>> getArticles();
}