import 'package:equatable/equatable.dart';

import '../../../../domian/entities/article.dart';
import 'package:dio/dio.dart';


abstract class RemoteArticleState extends Equatable{
  final List<ArticleEntity> ?article;
  final DioException? error;
 const  RemoteArticleState({this.error,this.article});

  @override
  List<Object> get props =>[article!,error!];

}

class RemoteArticlesLoading extends RemoteArticleState{
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState{
  const RemoteArticlesDone(List<ArticleEntity> article):super(article: article);
}
class RemoteArticlesError extends RemoteArticleState{
  const RemoteArticlesError(DioException error):super(error: error);
}