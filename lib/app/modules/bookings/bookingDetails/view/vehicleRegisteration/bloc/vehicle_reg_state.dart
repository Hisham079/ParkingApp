part of 'vehicle_reg_bloc.dart';

abstract class VehicleRegState {
  const VehicleRegState();
}

class VehicleRegInitial extends VehicleRegState {}

class AddVehicleSuccess extends VehicleRegState {}

class AddVehicleFailed extends VehicleRegState {
  AddVehicleFailed({required this.message});
  String message;
}
