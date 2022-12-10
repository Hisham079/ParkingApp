import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ParkingDtls extends StatelessWidget {
  ParkingDtls({super.key, required this.icn, required this.name});
  IconData icn;
  String name;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 106.w,
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Color.fromARGB(95, 223, 221, 221),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Icon(
              icn,
              size: 43.sp,
            ),
          ),
          SizedBox(
              // height: 70,
              // width: 70,
              child: Text(name)),
        ],
      ),
    );
  }
}
