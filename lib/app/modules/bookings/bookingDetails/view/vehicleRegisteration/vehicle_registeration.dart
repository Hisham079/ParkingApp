import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/app/modules/bookings/bookingDetails/view/vehicleRegisteration/bloc/vehicle_reg_bloc.dart';
import 'package:parking/app/modules/bookings/bookingDetails/view/vehicleRegisteration/vehicle_details.dart';
import 'package:parking/app/modules/settings/widget/btn_wdgt.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../app/infastructure/utils/validator.dart';
import '../../repo/createBookings.dart';
// import '../vehicle_details.dart';

class VehicleRegistration extends StatefulWidget {
  VehicleRegistration({super.key});

  @override
  State<VehicleRegistration> createState() => _BookingRegistrationState();
}

List<String> list = <String>[
  'Car',
  'bike',
  'Truck',
  'Bus',
  'Van',
  'MotorCycle',
  'Auto Rickshow',
  'Bicycle',
  'Taxi'
];

String dropdownValue = list.first;

class _BookingRegistrationState extends State<VehicleRegistration> {
  final vehicleAdd = FirebaseFirestore.instance.collection('userVehicle');
//   const uuid = Uuid();
  final auth = FirebaseAuth.instance;
// final _parkingId = uuid.v4();
  final addvcl = VehicleRegBloc();
  TextEditingController _vehicleNumber = TextEditingController(),
      _vehicleName = TextEditingController(),
      _vehicleType = TextEditingController();

  // int parkingSlot = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addvcl,
      child: BlocListener<VehicleRegBloc, VehicleRegState>(
        listener: (context, state) {
          if (state is AddVehicleSuccess) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Successfully added'),
            //   ),
            // );
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => VehicleRegisteration(),
              ),
            );
          } else if (state is AddVehicleFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 40, right: 40, top: 50),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: _vehicleNumber,
                      decoration: InputDecoration(
                          labelText: "Enter your vehicle no",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
                          return "Enter correct vehicle no";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: _vehicleName,
                      decoration: InputDecoration(
                          labelText: "Enter your Vehicle name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                      validator: ((value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[A-z]+$').hasMatch(value)) {
                          return "Enter correct licence no";
                        } else {
                          return null;
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Text('Choose your vehicle'),
                  // SizedBox(
                  //   height: 62,
                  //   child: DropdownButton<String>(
                  //     value: dropdownValue,
                  //     icon: const Icon(
                  //       Icons.arrow_drop_down_sharp,
                  //       size: 30,
                  //     ),
                  //     elevation: 16,
                  //     style: GoogleFonts.abhayaLibre(
                  //       fontSize: 21,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.black,
                  //     ),
                  //     onChanged: (String? value) {
                  //       setState(() {
                  //         dropdownValue = value!;
                  //       });
                  //     },
                  //     items: list.map<DropdownMenuItem<String>>((String value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(value),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  BtnWdgt(
                    ontap: () {
                      addvcl.add(AddVehiclEvent(
                          vehicleType: _vehicleType.text,
                          vehiclename: _vehicleName.text,
                          vehicleno: _vehicleNumber.text));
                    },
                    textClr: Colors.white,
                    name: 'Submit',
                    raduis: 30,
                    clr: const Color.fromARGB(255, 31, 73, 107),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
