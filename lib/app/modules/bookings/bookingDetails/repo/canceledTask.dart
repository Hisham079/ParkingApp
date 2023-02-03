import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CanceledPArking {
  Future<bool> cancelParkings(
    String? userId
      ) async {
    final tasks = FirebaseFirestore.instance.collection('canceledParkings');
    const uuid = Uuid();
    final parkingId = uuid.v4();
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;
    final date = DateFormat('EEEEE, dd,yyyy').format(DateTime.now());
    try {
      await tasks.doc(parkingId).get(
      
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
