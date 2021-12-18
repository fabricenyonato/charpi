import 'package:charpi/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: GoogleFonts.rammettoOne(
              fontSize: 32,
              color: Colors.grey.shade800,
            ),
          ),

          const SizedBox(height: 24),
          TextField(
            controller: _identifierCtrl,
            decoration: const InputDecoration(
              labelText: 'Email or username'
            ),
          ),

          const SizedBox(height: 16),
          TextField(
            controller: _passwordCtrl,
            decoration: const InputDecoration(
              labelText: 'Passord',
            ),
            obscureText: true,
          ),

          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: _onSubmit,
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty
                  .resolveWith((_) => Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
    );

    final body = SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: form,
        ),
      ),
    );

    return Scaffold(
      body: body,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _onSubmit,
      //   child: const Icon(Icons.save),
      // ),
    );
  }

  void _onSubmit() {
    onSubmit(_identifierCtrl.text, _passwordCtrl.text);
  }
}
