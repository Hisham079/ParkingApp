import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking/app/modules/bookings/bookingDetails/view/booking_parking.dart';
import 'package:parking/app/modules/bookings/bookingDetails/view/vehicleRegisteration/vehicle_registeration.dart';
import 'package:parking/razorpay/checkOUt.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class VehicleRegisteration extends StatefulWidget {
  VehicleRegisteration({super.key});

  @override
  State<VehicleRegisteration> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<VehicleRegisteration> {
  final userref = FirebaseFirestore.instance.collection('userVehicle');
  final auth = FirebaseAuth.instance;
  late Razorpay _razorpay;

  @override
  void initState() {
   
    super.initState();
    _razorpay = Razorpay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: userref
                  .where('userId', isEqualTo: auth.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                final vehicleData = snapshot.data!.docs;
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: vehicleData.length,
                    itemBuilder: (context, index) {
                      //return
                      //  Text(vehicleData[index]['vehicleNo'].toString());
                      if (snapshot.hasData) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingParking(),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 80, right: 80, top: 10, bottom: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Vehicle Name: '),
                                      Text(
                                          vehicleData[index]['vehicleName'].toString(),
                                          ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Vehicle No: ',),
                                      Text(
                                          vehicleData[index]['vehicleNo'].toString(),
                                          ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
          
                
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
           TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehicleRegistration(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
        ],
      ),
    );
  }
}
