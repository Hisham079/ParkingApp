part of 'registration_bloc.dart';

abstract class RegistrationState {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationSucces extends RegistrationState {}

class RegistrationFailed extends RegistrationState {
  RegistrationFailed({required this.error_message});
  String error_message;
}
