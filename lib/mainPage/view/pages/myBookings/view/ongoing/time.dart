import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/time_details.dart';
import 'extend_time.dart';

class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 150, 115),
        title: Text('Parking time'),
      ),
      body: Column(
        children: [
          Container(
            height: 200.h,
            width: 300.w,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15, color: Color.fromARGB(255, 238, 236, 236))
                ],
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white54),
            child: Center(
              child: Text(
                '16:09',
                style: GoogleFonts.lakkiReddy(fontSize: 33),
              ),
            ),
          ),
          TimeDetails(
            item: 'Parking Area',
            data: 'Calicut',
          ),
          TimeDetails(data: 'Address', item: '24,PalazhiRoad,Calicut'),
          TimeDetails(data: 'Vehicle', item: 'Calicut(AFRD 666'),
          TimeDetails(data: 'Parking Details', item: 'Ground Floor(G06)'),
          TimeDetails(data: 'Date', item: 'January 18,2022'),
          TimeDetails(data: 'data', item: 'item'),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 76, 150, 115))),
              onPressed: () {
                Get.to(ExtendTime());
              },
              child: Text(
                'Extend Parking Time',
                style: GoogleFonts.laila(),
              ))
        ],
      ),
    );
  }
}
