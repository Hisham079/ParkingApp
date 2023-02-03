import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
//import 'package:equatable/equatable.dart';

part 'vehicle_reg_event.dart';
part 'vehicle_reg_state.dart';

class VehicleRegBloc extends Bloc<VehicleRegEvent, VehicleRegState> {
  VehicleRegBloc() : super(VehicleRegInitial()) {
    on<VehicleRegEvent>((event, emit) async {
      if (event is AddVehiclEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final vehicleAdd =
              FirebaseFirestore.instance.collection('userVehicle');
          final userId = auth.currentUser!.uid;
          const uuid = Uuid();
          final vehicleId = uuid.v4();
          await vehicleAdd.doc(vehicleId).set({
            'vehicleNo': event.vehicleno,
            'vehicleName': event.vehiclename,
            // 'vehicleType': event.vehicleType,
            'vehicleId': vehicleId,
            'userId':userId,
          });
        } on FirebaseAuthException catch (e) {
          emit(AddVehicleFailed(message: e.code));
        }
      }
    });
  }
}
