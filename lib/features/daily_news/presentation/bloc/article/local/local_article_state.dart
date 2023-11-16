import 'package:equatable/equatable.dart';

import '../../../../domian/entities/article.dart';
import 'package:dio/dio.dart';


abstract class LocalArticleState extends Equatable{
  final List<ArticleEntity> ?article;
  final DioException? error;
  const  LocalArticleState({this.error,this.article});

  @override
  List<Object?> get props =>[article,error];


}

class LocalArticlesLoading extends LocalArticleState{
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticleState{
  const LocalArticlesDone(List<ArticleEntity> article):super(article: article);
}
