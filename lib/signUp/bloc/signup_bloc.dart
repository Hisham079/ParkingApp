import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:parking/sign_in/views/signIn.dart';

import '../../sign_in/bloc/authentication_bloc.dart';
import 'package:parking/app/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  SignupBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>(((event, emit) async {
      if (event is UserRegisterEvent) {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
        final UserStoring _storing = UserStoring();
        try {
          final userCredential = await _auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          UserDetails user = UserDetails(
              email: event.email,
              fname: event.fname,
              lname: event.lname,
              age: event.age,
              id: userCredential.user!.uid.toString());
          await _storing.saveUserDetails(user: user);
          // String fname;
          // String lname;
          // int age;

          emit(RegisterSuccess());
         
        } on FirebaseAuthException catch (e) {
          print(e.code);
          emit(RegisterFailed(error_message: e.code));
        }
      }
    }));
  }
}

class UserStoring {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future saveUserDetails({required UserDetails user}) async {
    await _firebaseFirestore
        .collection("usersdetails")
        .doc(_auth.currentUser!.uid)
        .set(user.toJson());
  }
}
