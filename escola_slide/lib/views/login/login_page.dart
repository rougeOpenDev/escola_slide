import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:escola_slide/blocs/authentication_bloc.dart';
import 'package:escola_slide/views/login/login_form.dart';
import 'package:escola_slide/models/user_repository.dart';
import 'package:escola_slide/blocs/login_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Salve Família',
        style: TextStyle(
            fontSize: 30.0,
            fontFamily: GoogleFonts.lobster().fontFamily,
            fontWeight: FontWeight.w400),
      )),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
