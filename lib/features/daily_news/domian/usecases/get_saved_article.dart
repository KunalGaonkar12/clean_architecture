import 'package:clean_architecture/features/daily_news/domian/repository/article_repositry.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/article.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>,void>{

  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({ void params}) {
    return _articleRepository.getSavedArticles();
  }

}