import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vinland/vinland.dart' as vi;

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required int id,
    required String title,
    required String summary,
    required String content,
    required String image,
  })
   = _Article;

  factory Article.fromRemote(vi.Article article) =>
    Article(
      id: article.id,
      title: article.attributes.title,
      summary: article.attributes.summary,
      content: article.attributes.content,
      image: article.attributes.image.data.attributes.url,
    );
}
