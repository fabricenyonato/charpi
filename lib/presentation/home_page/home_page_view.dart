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

class HomePageView extends StatelessWidget {
  final HomePageData data;
  final void Function() onLogin;

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
        success: (articles) => ListView.builder(
          itemCount: articles.length,
          itemBuilder: (_, index) {
            final article = articles[index];

            return ListTile(
              title: Text(article.title),
              subtitle: Text(article.summary),
            );
          }
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: onLogin,
            icon: const Icon(Icons.person)
          )
        ],
      ),
      body: body,
    );
  }
}
