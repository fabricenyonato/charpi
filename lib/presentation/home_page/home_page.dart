import 'package:charpi/presentation/home_page/home_page_bloc.dart';
import 'package:charpi/presentation/home_page/home_page_view.dart';
import 'package:flutter/cupertino.dart';
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
          return HomePageView(data: data);
        }
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }
}
