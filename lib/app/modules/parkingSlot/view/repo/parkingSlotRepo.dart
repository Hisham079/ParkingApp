// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
// import 'package:uuid/uuid.dart';

// class AddParkingSlot {
//   Future<bool> addParkingSlot(
//       {int? parkingSlot,
//       }) async {
//     final tasks = FirebaseFirestore.instance.collection('parkingSlot');
//     const uuid = Uuid();
//     final parkingId = uuid.v4();
//     final auth = FirebaseAuth.instance;
//     final userId = auth.currentUser!.uid;
//    // final date = DateFormat('EEEEE, dd,yyyy').format(DateTime.now());
//     try {
//       await tasks.doc('NjFVesviOtmSRlVjrcXk').set({
//         'parkingSlot': 25,
       
//       });
//       return true;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
