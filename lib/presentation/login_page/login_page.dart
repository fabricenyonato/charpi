import 'package:charpi/presentation/login_page/login_page_bloc.dart';
import 'package:charpi/presentation/login_page/login_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final LoginPageBloc bloc;

  const LoginPage({ Key? key, required this.bloc })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPageBloc, LoginPageData>(
        bloc: bloc,
        builder: (_, data) {
          return LoginPageView(
            data: data,
            onSubmit: _login,
          );
        }
    );
  }

  void _login(String identifier, String password) {
    bloc.login(identifier, password)
      .then((_) {
        print(bloc.state.user);
      });
  }
}
