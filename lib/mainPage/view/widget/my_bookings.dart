import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookings extends StatelessWidget {
  const MyBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 80.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),
      color: Color.fromARGB(255, 238, 238, 238)),
    child: Text('fjdn'),
    );
  }
}