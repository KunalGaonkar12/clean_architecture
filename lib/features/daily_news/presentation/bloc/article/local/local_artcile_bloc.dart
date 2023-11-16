import 'package:clean_architecture/features/daily_news/domian/usecases/get_saved_article.dart';
import 'package:clean_architecture/features/daily_news/domian/usecases/remove_article.dart';
import 'package:clean_architecture/features/daily_news/domian/usecases/save_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_artcile_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent,LocalArticleState>{
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;


  LocalArticleBloc(this._getSavedArticleUseCase,this._saveArticleUseCase,this._removeArticleUseCase)
      :super(const LocalArticlesLoading()){
    on <GetSavedArticles> (onGetSavedArticle);
    on <RemoveArticles> (onRemoveArticle);
    on <SaveArticles> (onSaveArticle);
  }

  void onGetSavedArticle(GetSavedArticles event,Emitter<LocalArticleState> emit) async{
    final articles= await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

void onRemoveArticle(RemoveArticles removeArticles,Emitter<LocalArticleState> emit) async{
    await _removeArticleUseCase(params: removeArticles.article);
    final articles= await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

void onSaveArticle(SaveArticles saveArticles,Emitter<LocalArticleState> emit) async{
    await _saveArticleUseCase(params: saveArticles.article);
    final articles= await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }



}