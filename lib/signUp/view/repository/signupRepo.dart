// import 'package:auth/auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignupRepo {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final userRef = FirebaseFirestore.instance.collection('UserDetails');
//   Future<String> createUser({
//     String? email,
//     String? password,
//     String? fname,
//     String? lname,
//     String? age,
//   }) async {
//     try {
//       final user_credential = await _auth.createUserWithEmailAndPassword(
//         email: email!,
//         password: password!,
//       );
//       await userRef.doc(user_credential.user!.uid).set({
//         'user_id': user_credential.user!.uid,
//         'first_name': fname,
//         'last_name': lname,
//         'password': password,
//         'email': email,
//         'age': age,
//       });
//       return 'true';
//     } on FirebaseException catch (e) {
//       print('--------------');
//       print(e.code);
//       return e.code;
      
//     }
//   }
// }
