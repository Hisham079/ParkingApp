part of 'registration_bloc.dart';

abstract class RegistrationEvent {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends RegistrationEvent {
  RegisterEvent({
    required this.email,
    required this.fname,
    required this.lname,
    required this.password,
  });
  String fname;
  String lname;
  String email;
  String password;
}
