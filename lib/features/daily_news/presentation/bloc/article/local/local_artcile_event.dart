import 'package:clean_architecture/features/daily_news/domian/entities/article.dart';
import 'package:equatable/equatable.dart';

abstract class LocalArticlesEvent extends Equatable{
  final ArticleEntity? article;
  const LocalArticlesEvent({this.article});

  @override
  List<Object> get props=>[article!];
  
}

class GetSavedArticles extends LocalArticlesEvent{
  const GetSavedArticles();
}

class SaveArticles extends LocalArticlesEvent{
  const SaveArticles(ArticleEntity? article):super(article: article);
}

class RemoveArticles extends LocalArticlesEvent{
  const RemoveArticles(ArticleEntity? article):super(article: article);
}