part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {}
class UserRegisterEvent extends AuthenticationEvent {
  UserRegisterEvent({required this.email, required this.password,required this.age,
  required this.fname,required this.lname});

  final String email;
  final String password;
  final String fname;
  final String lname;
  final String age;
}
