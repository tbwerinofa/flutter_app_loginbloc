import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapploginbloc/UserRepository.dart';
import 'package:flutterapploginbloc/authenticationbloc.dart';
import 'package:flutterapploginbloc/authenticationevent.dart';
import 'package:flutterapploginbloc/authenticationstate.dart';
import 'package:flutterapploginbloc/loadingindicator.dart';
import 'package:flutterapploginbloc/loginpage.dart';
import 'package:flutterapploginbloc/splashpage.dart';

import 'homepage.dart';

class SimpleBlocDelegate extends BlocDelegate {

  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('on transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print('error');
    super.onError(bloc, error, stackTrace);
  }
}
  void main(){
    BlocSupervisor.delegate = SimpleBlocDelegate();
    final userRepository = UserRepository();
    runApp(
      BlocProvider<AuthenticationBloc>(
        create:(context){
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
        child:App(userRepository:userRepository),
      ),
    );
  }


class App extends StatelessWidget{
  final UserRepository userRepository;
  App({Key key,@required this.userRepository}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder: (context,state){
          if(state is AuthenticationUninitialized){
            return SplashPage();
          }

          if(state is AuthenticationAuthenticated){
            return HomePage();
          }

          if(state is AuthenticationUnAuthenticated){
            return LoginPage(userRepository: userRepository);
          }

          if(state is AuthenticationLoading)
          {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}