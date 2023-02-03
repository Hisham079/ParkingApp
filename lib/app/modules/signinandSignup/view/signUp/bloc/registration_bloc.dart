import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) async {
      if (event is RegisterEvent) {
        final auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('Users');
        try {
          await auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          await userRef.doc(auth.currentUser!.uid).set({
            'userId': auth.currentUser!.uid,
            'fName': event.fname,
            'lname': event.lname,
            'email': event.email,
            'password': event.password,
            
          });
          emit(RegistrationSucces());
        } on FirebaseAuthException catch (e) {
          emit(RegistrationFailed(error_message: e.code));
        }
      }
    });
  }
}
