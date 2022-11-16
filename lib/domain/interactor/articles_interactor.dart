import '../../data/repository/article_repository.dart';
import '../model/article_model.dart';

class ArticleInteractor {
  final ArticleRepository _repository = ArticleRepository();

  Stream<List<ArticleModel>> get streamNotes =>
      _repository.getArticlesStream();
}