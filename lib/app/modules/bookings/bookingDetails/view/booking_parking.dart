import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../parking_dtls/booking_confirmation.dart';
import '../../../parking_dtls/date_time.dart';
import '../../../settings/widget/btn_wdgt.dart';

class BookingParking extends StatefulWidget {
  BookingParking({super.key});

  @override
  State<BookingParking> createState() => _BookingRegistrationState();
}

class _BookingRegistrationState extends State<BookingParking> {
  TextEditingController _timeForeParking = TextEditingController(),
      _dateandTime = TextEditingController();
  DateTime dateTime = DateTime.now();

  int parkingSlot = 0;
  final _auth = FirebaseAuth.instance;
  late DateAndTime _dateandtime;
  addData() async {
    final _addData = FirebaseFirestore.instance.collection('parkingDetails');
    var sample = await FirebaseFirestore.instance
        .collection('parkingDetails')
        .where('vehicleNo', isEqualTo: 'KL18 Y 3495')
        .get();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateandtime = DateAndTime(
      dateTime: dateTime,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
            //
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => DateAndTime(),
            //         ));
            //   },
            //   child: SizedBox(
            //     child: Card(
            //       child: Text('Date and Time'),
            //     ),
            //   ),
            // ),
            DateAndTime(dateTime: dateTime),

            SizedBox(
              height: 40,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _timeForeParking,
                decoration: InputDecoration(
                    labelText: "Time needed for parking",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
                validator: ((value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1-4}[)]{0-1}[-\s\./0-9]+$')
                          .hasMatch(value)) {
                    return "Invalid";
                  } else {
                    return null;
                  }
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmation(),
                    ));
                // addData() async {
                //   // final _addData = FirebaseFirestore.instance.collection('parkingDetails');
                //   var sample = await FirebaseFirestore.instance
                //       .collection('parkingDetails')
                //       .where('vehicleNo', isEqualTo: 'KL18 2375')
                //       .get();
                //   FirebaseFirestore.instance
                //       .collection('parkingDetails')
                //       .doc('bd07216a-91ca-4f67-887a-dfa78dea4683')
                //       .set({'timeForParking': _timeForeParking.text,
                //       'DateandTime':dateTime});
                // }

                // CreateParkingDetail().createParkingDetails(
                //   timeForParking: _timeForeParking.text,
                // );

                // .whenComplete(
                //   () => FirebaseFirestore.instance
                //       .collection('parkingSlot')
                //       .doc('NjFVesviOtmSRlVjrcXk')
                //       .set({
                //     'parkingSlot': parkingSlot-1,
                //   }),
                // );
                // AddParkingSlot().addParkingSlot(
                //     parkingSlot: (int.tryParse(CreateParkingDetail()
                //             .slotDetail
                //             .toString())! -
                //         1));
                // log(CreateParkingDetail().slotDetail.toString());
                // Navigator.pop(context);
              },
              child: BtnWdgt(
                textClr: Colors.white,
                name: 'Submit',
                raduis: 30,
                clr: const Color.fromARGB(255, 31, 73, 107),
              ),
            )
          ],
        ),
      ),
    );
  }
}
