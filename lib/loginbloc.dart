import 'dart:async';
import 'package:flutterapploginbloc/authenticationevent.dart';
import 'package:flutterapploginbloc/loginstate.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'UserRepository.dart';
import 'authenticationbloc.dart';
import 'loginevent.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
      @required this.userRepository,
      @required this.authenticationBloc}): assert(userRepository != null),
        assert(authenticationBloc !=null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event)async*{
    if(event is LoginButtonPressed){
      yield LoginLoading();

      try{

        final token = await userRepository.authenticate(
          username:event.userName,
          password: event.password
        );

        authenticationBloc.add(LoggedIn(token:token));
        yield LoginInitial();
      }
      catch(error){
        yield LoginFailure(error:error.toString());
      }
    }
  }
}