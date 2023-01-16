import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) {
      // TODO: implement event handler
      // print('-------------------');
      // print(event);
      if (event is ChangeThemeEvent) {
        print('[[[[[[[[[[[]]]]]]]]]]]');
        print(event.value);
        emit(ThemeChangeState(res: !event.value));
      }
    });
  }
}
