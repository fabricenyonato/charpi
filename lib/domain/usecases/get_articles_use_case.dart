import 'package:charpi/domain/entities/article.dart';
import 'package:charpi/domain/repositories/vinland_repository.dart';

class GetArticleUseCase {
  final VinlandRepository repository;

  GetArticleUseCase({ required this.repository });

  Future<List<Article>> call() =>
    repository.getArticles();
}
