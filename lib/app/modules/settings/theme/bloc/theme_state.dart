part of 'theme_bloc.dart';


abstract class ThemeState extends Equatable {
  const ThemeState();
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeChangeState extends ThemeState {
  bool res;
  ThemeChangeState({required this.res});
   @override
     List<Object> get props => [res];
}
