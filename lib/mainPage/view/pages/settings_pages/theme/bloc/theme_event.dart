part of 'theme_bloc.dart';


abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  bool value = false;
  ChangeThemeEvent({required this.value});
}
