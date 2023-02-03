import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CreateParkingDetail {
  Future<bool> createParkingDetails(
      {String? vehicleNo,
      String? licenceNo,
      String? vehicleType,
      String?parkingId,
      String? address,
      String? timeForParking}) async {
    final tasks = FirebaseFirestore.instance.collection('parkingDetails');
    const uuid = Uuid();
    final parkingId = uuid.v4();
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;
    final date = DateFormat('EEEEE, dd,yyyy').format(DateTime.now());
    try {
      await tasks.doc(parkingId).set({
        'parkingId': parkingId,
        'vehicleNo': vehicleNo,
        'licenceNo': licenceNo,
        'vehicleType': vehicleType,
        'adress': address,
        'timeForParking': timeForParking,
        'parkingId':parkingId
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }

//   String slotDetail = '';
//    getSlotNumber() {
//     var slotNumber = FirebaseFirestore.instance
//         .collection('userVehicles')
//         .doc('NjFVesviOtmSRlVjrcXk')
//         .get();
//     slotDetail = slotNumber.toString();
    
//   }
 }
