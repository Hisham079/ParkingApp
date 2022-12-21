import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/widget/details.dart';

class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Parking Name',
              style: GoogleFonts.laila(fontSize: 17),
            ),
          ),
          ListTile(
            title: Text('HiLite Parking'),
            subtitle: Text(
              '5th,Calicut,Poovangal,Kerala 673014',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
              height: 300,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 198, 197, 197),
                        blurRadius: 3)
                  ]),
              child: Column(
                children: [
                  Details(
                      name: 'Booking ID:',
                      details: 'P021467384',
                      name2: 'Parking Slot:',
                      details2: 'Ground Floor'),
                  Details(
                      name: 'reserverd Date:',
                      details: 'JAn,18,2022',
                      name2: 'Time:',
                      details2: '6:30 PM'),
                  Details(
                      name: 'Vehicle Details:',
                      details: 'Toyota(AFD 6397)',
                      name2: 'Vehicle Type:',
                      details2: 'Luxury seden')
                ],
              ))
        ],
      ),
    );
  }
}
