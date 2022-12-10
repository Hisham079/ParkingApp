part of 'authentication_bloc.dart';


abstract class AuthenticationEvent {}

class UserLoginEvent extends AuthenticationEvent {
    UserLoginEvent({required this.email, required this.password});

  String email;
  String password;
}

class UserRegisterEvent extends AuthenticationEvent {
    UserRegisterEvent({required this.email,required this.password});

 final  String email;
 final String password;
}
