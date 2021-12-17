import 'package:charpi/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_view.freezed.dart';

@freezed
class LoginPageData with _$LoginPageData {
  const factory LoginPageData({
    required bool inProgress,
    Object? error,
    User? user,
  })
  = _LoginPageData;
}

class LoginPageView extends StatelessWidget {
  final LoginPageData data;
  final void Function(String, String) onSubmit;

  final _identifierCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  LoginPageView({
    Key? key,
    required this.data,
    required this.onSubmit,
  })
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _identifierCtrl,
          ),

          const SizedBox(height: 16),

          TextField(
            controller: _passwordCtrl,
          ),
        ],
      ),
    );

    return Scaffold(
      body: form,
      floatingActionButton: FloatingActionButton(
        onPressed: _onSubmit,
        child: const Icon(Icons.save),
      ),
    );
  }

  void _onSubmit() {
    onSubmit(_identifierCtrl.text, _passwordCtrl.text);
  }
}
