part of 'authentication_bloc.dart';


abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginFailed extends AuthenticationState {
  LoginFailed({required this.error_message});
  String error_message;
  
}



