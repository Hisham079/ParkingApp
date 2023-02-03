import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parking/sharedPreRepo/shredPref.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, LoginState> {
  AuthenticationBloc() : super(LoginInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is UserLoginEvent) {
        final FirebaseAuth auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          await SharedPref().setUserData(event.email, auth.currentUser!.uid);
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailed(error_message: e.code));
        }
      }
    });
  }
}
