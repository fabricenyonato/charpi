import 'package:charpi/di.dart';
import 'package:charpi/presentation/home_page/home_page_bloc.dart';
import 'package:charpi/presentation/home_page/home_page_view.dart';
import 'package:charpi/presentation/login_page/login_page.dart';
import 'package:charpi/presentation/login_page/login_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final HomePageBloc bloc;

  const HomePage({ Key? key, required this.bloc })
    : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc get _bloc => widget.bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageData>(
      bloc: _bloc,
        builder: (_, data) {
          return HomePageView(
            data: data,
            onLogin: _goToLogin,
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  void _goToLogin() {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => LoginPage(bloc: getit<LoginPageBloc>()),
    ));
  }
}
