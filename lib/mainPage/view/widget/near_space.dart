import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NearSpace extends StatelessWidget {
  const NearSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.h,
        width: 100.w,
        //color: Colors.white,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Color.fromARGB(255, 212, 212, 212)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                Container(
                  height: 82.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    boxShadow: [
                      BoxShadow(blurRadius: 7, color: Colors.white24)
                    ],
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://img.staticmb.com/mbcontent//images/uploads/2022/9/should-you-pay-extra-for-parking-spaces.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  // child: Image.network(
                  //   'https://img.staticmb.com/mbcontent//images/uploads/2022/9/should-you-pay-extra-for-parking-spaces.jpg',
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ]),
            ),
            Column(
              children: [
                SizedBox(
                  height: 13.h,
                ),
                Text('Booking ID:P0346571655',
                    style: GoogleFonts.laila(fontWeight: FontWeight.w500)),
                Text('HiLite Bussiness Park', style: GoogleFonts.laila()),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      '24,Palazhi Road,Calicut',
                      style: GoogleFonts.laila(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
