import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/daily_news/domian/entities/article.dart';
import 'package:clean_architecture/features/daily_news/domian/repository/article_repositry.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({ void params}) {
    return _articleRepository.getNewsArticles();
  }

}