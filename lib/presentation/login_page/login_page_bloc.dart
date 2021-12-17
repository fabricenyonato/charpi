import 'package:charpi/domain/usecases/login_use_case.dart';
import 'package:charpi/presentation/login_page/login_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageBloc extends Cubit<LoginPageData> {
  final LoginUseCase loginUseCase;

  LoginPageBloc({
    required LoginPageData initialState,
    required this.loginUseCase,
  })
    : super(initialState);

  Future<void> login(String identifier, String password) {
    emit(state.copyWith(inProgress: true));

    return loginUseCase(identifier, password)
      .then((value) {
        emit(state.copyWith(inProgress: false, user: value));
      })
      .catchError((error) {
        emit(state.copyWith(inProgress: false, error: error));
      });
  }
}
