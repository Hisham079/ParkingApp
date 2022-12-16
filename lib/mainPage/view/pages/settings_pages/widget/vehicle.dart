import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/mainPage/view/pages/settings_pages/widget/vehicle.dart';

import '../my_vehicle.dart';

class Vehicle extends StatefulWidget {
  Vehicle(
      {super.key,
      this.icnbtn,
      required this.vcl_name,
      required this.vcl_no,
      this.clr});
  IconButton? icnbtn;
  String? vcl_name;
  String? vcl_no;

  Color? clr;
  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.h,
        width: 350.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Color.fromARGB(255, 230, 228, 228),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Color.fromARGB(255, 121, 118, 118))
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Container(
                  height: 60.h,
                  width: 80.w,
                  color: Colors.yellow,
                ),
                title: Text(
                  widget.vcl_name.toString(),
                  style: GoogleFonts.laila(fontSize: 16),
                ),
                subtitle: Text(widget.vcl_no.toString()),
                trailing: Icon(
                  FontAwesomeIcons.dotCircle,
                  color: widget.clr,
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
    
  }
}
