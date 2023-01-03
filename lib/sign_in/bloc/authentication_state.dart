part of 'authentication_bloc.dart';


abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

class LoginFailed extends AuthenticationState {
  String error_message;
  LoginFailed({required this.error_message});
}



