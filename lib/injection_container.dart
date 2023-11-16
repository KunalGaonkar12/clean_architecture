import 'package:clean_architecture/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/domian/usecases/get_saved_article.dart';
import 'package:clean_architecture/features/daily_news/domian/usecases/remove_article.dart';
import 'package:clean_architecture/features/daily_news/domian/usecases/save_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_artcile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/daily_news/data/repository/article_repository.dart';
import 'features/daily_news/domian/repository/article_repositry.dart';
import 'features/daily_news/domian/usecases/get_article.dart';
import 'features/daily_news/presentation/bloc/article/remote/remote_artcile_bloc.dart';

final sl =GetIt.instance;

Future<void> initializeDependencies() async{

  //Database
  final database= await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());


  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(),sl()));

  //UseCase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //Bloc
  sl.registerFactory<LocalArticleBloc>(()=>LocalArticleBloc(sl(),sl(),sl()));



 //Bloc
  sl.registerFactory<RemoteArticleBloc>(()=>RemoteArticleBloc(sl()));
}