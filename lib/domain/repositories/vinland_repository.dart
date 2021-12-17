import 'package:charpi/domain/entities/article.dart';

abstract class VinlandRepository {
  Future<List<Article>> getArticles();
}
