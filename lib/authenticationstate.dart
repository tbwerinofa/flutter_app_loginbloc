import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props =>[];
}

class AuthenticationUninitialized extends AuthenticationState{}
class AuthenticationAuthenticated extends AuthenticationState{}
class AuthenticationUnAuthenticated extends AuthenticationState{}
class AuthenticationLoading extends AuthenticationState{}