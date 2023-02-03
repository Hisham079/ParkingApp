import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Notifictn_wdgt extends StatelessWidget {
  Notifictn_wdgt(
      {super.key,
      required this.name,
      required this.data,
      required this.icn,
      this.clr,
      this.ontap,
      this.btn_name});
  String name;
  String data;
  IconData icn;
  Color? clr;
  String? btn_name;
  Widget? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Color.fromARGB(255, 207, 206, 206))
            ]),
        height: 80.h,
        width: 350.w,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icn,
              color: clr,
              size: 32.sp,
            ),
          ),
          title: Text(name),
          subtitle: Text(data),
          trailing: TextButton(
              onPressed: () {
                Get.to(ontap);
              },
              child: Text(btn_name.toString())),
        ),
      ),
    );
  }
}
