
class ParkingDetails {
  ParkingDetails({
    required this.vehicleno,
    required this.licenceno,
    required this.vehicletype,
    required this.address,
    required this.timeforparking,
  });
  late final String vehicleno;
  late final String licenceno;
  late final String vehicletype;
  late final String address;
  late final int timeforparking;
  
  // ParkingDetails.fromJson(Map<String, dynamic> json){
  //   vehicleno = json['vehicleno'];
  //   licenceno = json['licenceno'];
  //   vehicletype = json['vehicletype'];
  //   address = json['address'];
  //   timeforparking = json['timeforparking'];
  // }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vehicleno'] = vehicleno;
    _data['licenceno'] = licenceno;
    _data['vehicletype'] = vehicletype;
    _data['address'] = address;
    _data['timeforparking'] = timeforparking;
    return _data;
  }
}