import '../../../../core/usecases/usecase.dart';
import '../entities/article.dart';
import '../repository/article_repositry.dart';

class SaveArticleUseCase implements UseCase<void,ArticleEntity>{

  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ ArticleEntity? params}) {
    return _articleRepository.saveArticle(params!);
  }

}