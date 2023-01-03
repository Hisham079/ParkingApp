part of 'signup_bloc.dart';

class RegisterSuccess extends AuthenticationState {
  // String error_message;
  // RegisterSuccess({required this.error_message});
}

class RegisterFailed extends AuthenticationState {
  String error_message;
  RegisterFailed({required this.error_message});
}
