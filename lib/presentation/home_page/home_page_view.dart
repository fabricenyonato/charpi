import 'package:cached_network_image/cached_network_image.dart';
import 'package:charpi/core/data_state.dart';
import 'package:charpi/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_view.freezed.dart';

@freezed
class HomePageData with _$HomePageData {
  const factory HomePageData({ required DataState<List<Article>> articles })
    = _HomePageData;
}

class _ArticleImagePlaceholder extends StatelessWidget {
  const _ArticleImagePlaceholder({ Key? key })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
    );
  }
}

class _Article extends StatelessWidget {
  final Article article;

  const _Article({ Key? key, required this.article })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imagePlaceholder = _ArticleImagePlaceholder();

    final image = CachedNetworkImage(
      imageUrl: article.realImage,
      errorWidget: (_, __, ___) => imagePlaceholder,
      placeholder: (_, __) => imagePlaceholder,
      imageBuilder: (_, image) => Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200,
        ),
      ),
    );

    final title = Text(
      article.title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    final summary = Text(
      article.summary,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          const SizedBox(height: 4),
          title,
          const SizedBox(height: 2),
          summary,
        ],
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  final List<Article> articles;

  const _SuccessView({ Key? key, required this.articles })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: articles.length,
      itemBuilder: (_, index) {
        final article = articles[index];

        return _Article(article: article);
      }
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onUserTap;

  const _TopBar({ Key? key, required this.onUserTap })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    const input = TextField(
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
        hintText: 'Search articles'
      ),
    );

    final avatar = GestureDetector(
      onTap: onUserTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade300,
        ),
        child: Icon(
          Icons.person_outline,
          color: Colors.grey.shade700,
        ),
      ),
    );

    final bar = Container(
      padding: const EdgeInsets.only(
        left: 8,
        top: 4,
        right: 4,
        bottom: 4,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: input
          ),
          const SizedBox(width: 8),
          avatar,
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Column(
      children: [
        bar,
        Divider(color: Colors.grey.shade300, thickness: 1, height: 1)
      ],
    );
  }
}

class HomePageView extends StatelessWidget {
  final HomePageData data;
  final VoidCallback onLogin;

  const HomePageView({
    Key? key,
    required this.data,
    required this.onLogin,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = data.articles.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error) => Center(
          child: Text(error.toString()),
        ),
        success: (articles) =>
          _SuccessView(articles: articles)
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
        ),
        child: Column(
          children: [
            _TopBar(onUserTap: onLogin),
            Expanded(child: body)
          ],
        ),
      ),
    );
  }
}
