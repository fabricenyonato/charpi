import 'package:charpi/core/data_state.dart';
import 'package:charpi/data/repositories/vinland_repository_impl.dart';
import 'package:charpi/domain/repositories/vinland_repository.dart';
import 'package:charpi/domain/usecases/get_articles_use_case.dart';
import 'package:charpi/domain/usecases/login_use_case.dart';
import 'package:charpi/presentation/home_page/home_page_bloc.dart';
import 'package:charpi/presentation/home_page/home_page_view.dart';
import 'package:charpi/presentation/login_page/login_page_bloc.dart';
import 'package:charpi/presentation/login_page/login_page_view.dart';
import 'package:charpi/vars.dart';
import 'package:get_it/get_it.dart';
import 'package:vinland/vinland.dart' as vi;

final getit = GetIt.instance;

void _registerUseCases() {
  final getArticlesUseCase = GetArticleUseCase(repository: getit());
  getit.registerSingleton<GetArticleUseCase>(getArticlesUseCase);

  final loginUseCase = LoginUseCase(repository: getit());
  getit.registerSingleton<LoginUseCase>(loginUseCase);
}

void _registerBlocs() {
  getit.registerFactory<HomePageBloc>(() => HomePageBloc(
    initialState: const HomePageData(
      articles: DataState.success([])
    ),
    getArticleUseCase: getit()
  ));

  getit.registerFactory<LoginPageBloc>(() => LoginPageBloc(
    initialState: const LoginPageData(inProgress: false),
    loginUseCase: getit()
  ));
}

void initDi() {
  const vinland = vi.Vinland(baseUrl: '$apiUrl/api');
  getit.registerSingleton<vi.Vinland>(vinland);

  final vinlandRepository = VinlandRepositoryImpl(vinland: getit());
  getit.registerSingleton<VinlandRepository>(vinlandRepository);

  _registerUseCases();
  _registerBlocs();
}
