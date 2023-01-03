import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is UserLoginEvent) {
        final FirebaseAuth auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(error_message: e.code));
        }
      }
    });
  }
}
