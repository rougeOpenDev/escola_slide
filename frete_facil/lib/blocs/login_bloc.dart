import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:frete_facil/events/login_event.dart';
import 'package:frete_facil/states/login_state.dart';
import 'package:frete_facil/models/user_repository.dart';
import 'package:frete_facil/blocs/authentication_bloc.dart';
import 'package:frete_facil/events/authentication_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
      
        if (event.username != '' && event.password != '') {

          final token = await userRepository.authenticate(
            username: event.username,
            password: event.password,
          );

          authenticationBloc.add(LoggedIn(token: token));
        } else {

          throw new Exception('Dados inválidos');
        }

        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}