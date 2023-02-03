part of 'authentication_bloc.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  LoginFailed({required this.error_message});
  String error_message;
  
}



