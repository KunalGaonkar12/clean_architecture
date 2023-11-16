import 'package:clean_architecture/features/daily_news/domian/repository/article_repositry.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/article.dart';

class RemoveArticleUseCase implements UseCase<void,ArticleEntity>{

  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.removeArticle(params!);
  }

}