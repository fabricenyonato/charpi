import 'package:charpi/domain/entities/article.dart';
import 'package:charpi/domain/entities/user.dart';

abstract class VinlandRepository {
  Future<List<Article>> getArticles();
  Future<User> login(String identifier, String password);
}
