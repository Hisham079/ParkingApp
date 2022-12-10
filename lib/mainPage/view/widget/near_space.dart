import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: Container(
                height: 82.h,
                width: 75.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    boxShadow: [
                      BoxShadow(blurRadius: 7, color: Colors.white24)
                    ],
                    color: Colors.white),
                child: Image.network(
                  'https://img.staticmb.com/mbcontent//images/uploads/2022/9/should-you-pay-extra-for-parking-spaces.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
