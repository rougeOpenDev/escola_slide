import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';

import 'package:escola_slide/models/managers/courses_manager.dart';
import 'package:escola_slide/models/managers/user_manager.dart';
import 'package:escola_slide/events/authentication_event.dart';
import 'package:escola_slide/states/authentication_state.dart';
import 'package:escola_slide/blocs/authentication_bloc.dart';
import 'package:escola_slide/models/user_repository.dart';

import 'package:escola_slide/views/loading_indicator.dart';
import 'package:escola_slide/views/login/login_page.dart';
import 'package:escola_slide/views/principal_page.dart';
import 'package:escola_slide/views/splash_page.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CoursesManager(),
            lazy: true,
          ),
          ChangeNotifierProvider(
            create: (_) => UserManager(),
            lazy: true,
          ),
        ],
        child: MaterialApp(
          title: 'Escola de Slide',
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              primarySwatch: Colors.green,
              accentColor: Colors.greenAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return PrincipalPage();
              }

              if (state is AuthenticationUnauthenticated) {
                return LoginPage(userRepository: userRepository);
              }

              if (state is AuthenticationLoading) {
                // return LoadingIndicator();
                return SplashPage();
              }

              return SplashPage();
            },
          ),
        ));
  }
}
