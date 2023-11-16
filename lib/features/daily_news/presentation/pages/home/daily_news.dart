import 'dart:async';

import 'package:clean_architecture/features/daily_news/data/models/artcile.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_artcile_bloc.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_artcile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domian/entities/article.dart';
import '../../widgets/artcile_tile.dart';

class DailyNews extends StatelessWidget {
   DailyNews({Key? key}) : super(key: key);

  Article dummyArticle=const Article(
    id: 1,
    title: "",
    author: "",
    content: "",
    description: "",
    publishedAt: "",
    url: "",
    urlToImage: "",
  );

  final StreamController<int> _controller= StreamController.broadcast(sync: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildBody(),
    );
  }

   _appBar(BuildContext context){
    return AppBar(
      title: const Text('Daily News',
      style: TextStyle(
        color: Colors.black
      ),),actions: [
        IconButton(onPressed: ()=>_onShowSavedArticlesViewTapped(context), icon:const Icon(Icons.bookmark))
    ],
    );
  }

  _buildBody(){
    return BlocBuilder<RemoteArticleBloc,RemoteArticleState>(builder: (_,state){
      if(state is RemoteArticlesLoading){
        return  Skeletonizer(enabled: true,child:ListView.builder(itemBuilder: (context,index){
          return ArticleWidget(article:dummyArticle,onArticlePressed: (article) => _onArticlePressed(context,article),descriptionColor: Colors.black.withOpacity(0.08),);
        },itemCount: 10),);
      }
      if(state is RemoteArticlesError){
        return  Center(child: IconButton(onPressed: (){},icon: const Icon(Icons.refresh)));
      }
      if(state is RemoteArticlesDone){
        return ListView.builder(itemBuilder: (context,index){
          return ArticleWidget(article: state.article![index],onArticlePressed: (article) => _onArticlePressed(context,article),);
        },itemCount: state.article!.length);
      }
      return const SizedBox();
    });

  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
