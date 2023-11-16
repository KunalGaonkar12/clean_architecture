
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_artcile_event.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_artcile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domian/usecases/get_article.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent,RemoteArticleState>{

 final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase):super(const  RemoteArticlesLoading()){
    on<GetArticles> (onGetArticle);
  }

 Future<void>  onGetArticle(GetArticles event,Emitter<RemoteArticleState> emit) async{
    final dataState= await _getArticleUseCase();

    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
    emit(
      RemoteArticlesDone(dataState.data!)
    );
    }

    if(dataState is DataFailed){
      print(dataState.error!.message);
    emit(
      RemoteArticlesError(dataState.error!)
    );
    }

  }
}