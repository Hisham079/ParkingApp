import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parking/app/infastructure/utils/validator.dart';
import 'package:parking/mainPage/view/pages/bookingDetails/repo/createBookings.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/widget/textWidget.dart';
import 'package:parking/mainPage/view/pages/settings_pages/widget/btn_wdgt.dart';
import 'package:parking/mainPage/view/widget/dropdownButton.dart';
import 'package:parking/parkingSlot/view/repo/parkingSlotRepo.dart';
import 'package:uuid/uuid.dart';

class BookingDetails extends StatelessWidget {
  BookingDetails({super.key});

  TextEditingController _vehicleNumber = TextEditingController(),
      _licenceNumder = TextEditingController(),
      _vehicleType = TextEditingController(),
      _address = TextEditingController(),
      _timeForeParking = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 40, right: 40),
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
                      controller: _licenceNumder,
                      decoration: InputDecoration(
                          labelText: "Enter your licence no",
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
                  SizedBox(
                      height: 62,
                      child: DropdownBtn(
                          items: ['car', 'bike'], text: 'Vehicle type')),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: _address,
                      decoration: InputDecoration(
                          labelText: "Address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                      validator: Validators.noneEmptyValidator,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                      CreateParkingDetail().createParkingDetails(
                          vehicleNo: _vehicleNumber.text,
                          licenceNo: _licenceNumder.text,
                          vehicleType: _vehicleType.text,
                          address: _address.text,
                          timeForParking: _timeForeParking.text).whenComplete(() =>  FirebaseFirestore.instance.collection('parkingSlot').doc('NjFVesviOtmSRlVjrcXk').set({
        'parkingSlot': 30,
       
      }));
                      // AddParkingSlot().addParkingSlot(
                      //     parkingSlot: (int.tryParse(CreateParkingDetail()
                      //             .slotDetail
                      //             .toString())! -
                      //         1));
                      // log(CreateParkingDetail().slotDetail.toString());
                      Navigator.pop(context);
                    },
                    child: BtnWdgt(
                      textClr: Colors.white,
                      name: 'Submit',
                      raduis: 30,
                      clr: Color.fromARGB(255, 31, 73, 107),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
