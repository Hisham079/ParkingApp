import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BtnWdgt extends StatelessWidget {
  BtnWdgt(
      {super.key, required this.name, required this.raduis, required this.clr});
  String name;
  int raduis;
  Color clr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 40.h,
          width: 343.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(raduis.r),
              color: clr,
              boxShadow: [
                BoxShadow(
                    blurRadius: 12.r, color: Color.fromARGB(255, 178, 177, 177))
              ]),
          child: Center(
              child: Text(
            name,
            style:
                GoogleFonts.laila(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ))),
    );
  }
}
