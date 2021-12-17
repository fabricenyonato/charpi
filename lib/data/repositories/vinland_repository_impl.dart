import 'package:charpi/domain/entities/article.dart';
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
          .map((item) => Article(
            title: item.attributes.title,
            summary: item.attributes.summary,
          ))
          .toList();
      });
  }

}
