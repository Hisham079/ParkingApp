import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class DeleteBooking {
  Future<bool> deleteTask({String? userId}) async {
    final tasks = FirebaseFirestore.instance.collection('parkingDetails');
    try {
      await tasks.doc(userId).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}

