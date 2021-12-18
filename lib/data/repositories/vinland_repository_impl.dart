import 'package:charpi/domain/entities/article.dart';
import 'package:charpi/domain/entities/user.dart';
import 'package:charpi/domain/repositories/vinland_repository.dart';
import 'package:vinland/vinland.dart' as vi;

class VinlandRepositoryImpl implements VinlandRepository {
  final vi.Vinland vinland;

  VinlandRepositoryImpl({ required this.vinland });

  @override
  Future<List<Article>> getArticles() {
    return vinland.collections.articles.all()
      .then((response) {
        return response.data
          .map(Article.fromRemote)
          .toList();
      });
  }

  @override
  Future<User> login(String identifier, String password) {
    return vinland.auth.login(vi.LoginRequestBody(
      identifier: identifier,
      password: password,
    ))
      .then((response) {
        return User(
            id: response.user.id,
            username: response.user.username,
            email: response.user.email,
            jwt: response.jwt
        );
    });
  }
}
