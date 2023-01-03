import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/padking_detls.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/parking_ticket.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/widget/details.dart';
import 'package:parking/mainPage/view/pages/settings_pages/payment/payment.dart';

import '../settings_pages/widget/notification_widget.dart';

class BookingConfirmation extends StatelessWidget {
  const BookingConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
        backgroundColor: Color.fromARGB(255, 76, 150, 115),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Parking Name',
                style: GoogleFonts.laila(fontSize: 17),
              ),
            ),
            SlotRemain(),
            Container(
                height: 380,
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
                        details2: 'Luxury seden'),
                    Text(
                      '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                    SizedBox(
                      width: 309,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cost'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Parking hours(1hr)'),
                              Text('\$10')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Tax'), Text('\$3')],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Total Amount'), Text('\$13')],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Notifictn_wdgt(
              name: 'Paypal',
              data: 'xxxx xxxx xxxx 2354',
              icn: FontAwesomeIcons.paypal,
              clr: Colors.blue,
              btn_name: 'change',
              ontap: PaymentPage(),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ParkingTicket());
              },
              child: Container(
                  height: 40.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Color.fromARGB(255, 76, 150, 115),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 12.r,
                            color: Color.fromARGB(255, 178, 177, 177))
                      ]),
                  child: Center(
                      child: Text(
                    'Confirm Payment',
                    style:
                        GoogleFonts.laila(fontSize: 16.sp, color: Colors.white),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
