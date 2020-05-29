import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapploginbloc/UserRepository.dart';
import 'package:flutterapploginbloc/authenticationevent.dart';
import 'package:flutterapploginbloc/authenticationstate.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository}):assert(userRepository!=null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      )async*{
    if(event is AppStarted)
      {
        final bool hasToken = await userRepository.hasToken();

        if(hasToken){
          yield AuthenticationAuthenticated();
        }else{
          yield AuthenticationUnAuthenticated();
        }
     }

    if(event is LoggedIn)
      {
        yield AuthenticationLoading();
        await userRepository.persistToken(event.token);
        yield AuthenticationAuthenticated();
      }

    if(event is LoggedOut)
    {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationAuthenticated();
    }



  }
}