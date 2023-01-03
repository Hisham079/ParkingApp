import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/widget/details.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/widget/textWidget.dart';
import 'package:parking/mainPage/view/pages/settings_pages/widget/btn_wdgt.dart';

class ParkingTicket extends StatelessWidget {
  const ParkingTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Ticker'),
        backgroundColor: Color.fromARGB(255, 76, 150, 115),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 157, 156, 156),
                          blurRadius: 5)
                    ]),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Text('''
        Scan this on the scanner machine when
                     you are in the parking
        ''', style: GoogleFonts.robotoSlab(fontWeight: FontWeight.w500)),
                    Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(blurRadius: 12, color: Colors.grey)
                          ]),
                      child: Center(child: Text('QR code')),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWdgt(txt: 'Name', txt2: 'Hisham'),
                              TextWdgt(txt: 'Parking Area', txt2: 'Hilite'),
                              TextWdgt(txt: 'Duration', txt2: '2Hours'),
                              TextWdgt(txt: 'Hours', txt2: '6:30 PM-8:30 PM'),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWdgt(txt: 'Vehicle', txt2: 'Alto800'),
                              TextWdgt(
                                txt: 'Parking slot',
                                txt2: 'Ground Floor (B3)',
                              ),
                              TextWdgt(txt: 'Date', txt2: 'December 17,2022'),
                              TextWdgt(txt: 'Phone', txt2: '7034 404247'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              BtnWdgt(
                name: 'Get Direction',
                raduis: 10,
                clr: Color.fromARGB(255, 76, 150, 115),
              ),
              BtnWdgt(name: 'Not Now', raduis: 10, clr: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
