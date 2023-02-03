part of 'vehicle_reg_bloc.dart';

abstract class VehicleRegEvent  {
  const VehicleRegEvent();

 
}
class AddVehiclEvent extends VehicleRegEvent{
  AddVehiclEvent({
    required this.vehicleType,
    required this.vehiclename,
    required this.vehicleno,

  });
  String vehiclename;
  String vehicleno;
  String vehicleType;

}
