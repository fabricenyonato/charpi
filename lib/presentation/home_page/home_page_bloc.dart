import 'package:charpi/core/data_state.dart';
import 'package:charpi/domain/usecases/get_articles_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charpi/presentation/home_page/home_page_view.dart';

class HomePageBloc extends Cubit<HomePageData> {
  final GetArticleUseCase getArticleUseCase;

  HomePageBloc({
    required HomePageData initialState,
    required this.getArticleUseCase,
  })
    : super(initialState);

  void init() {
    emit(state.copyWith(articles: const DataState.loading()));

    getArticleUseCase()
      .then((articles) {
        emit(state.copyWith(articles: DataState.success(articles)));
      })
      .catchError((error) {
        emit(state.copyWith(articles: DataState.error(error)));
      });
  }
}
