// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parking/mainPage/view/pages/settings_pages/customise_options.dart';
import 'package:parking/mainPage/view/pages/settings_pages/feedback.dart';
import 'package:parking/mainPage/view/pages/settings_pages/history.dart';
import 'package:parking/mainPage/view/pages/settings_pages/my_vehicle.dart';
import 'package:parking/mainPage/view/pages/settings_pages/payment/payment.dart';
import 'package:parking/mainPage/view/widget/settings_tile.dart';

class AccntSettings extends StatelessWidget {
  const AccntSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height.h,
          width: MediaQuery.of(context).size.width.w,
          color: Color.fromARGB(255, 241, 237, 237),
          child: Column(
            children: [
              Container(
                height: 375.h,
                width: 343.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Color.fromARGB(255, 174, 174, 174))
                    ]),
                child: Column(
                  children: [
                    Setting_tile(
                        icn: Icons.person,
                        arrow: Icons.arrow_forward_ios,
                        name: 'My account'),
                    InkWell(
                      onTap: () {
                        Get.to(MyVehicle());
                      },
                      child: Setting_tile(
                          icn: Icons.car_crash,
                          arrow: Icons.arrow_forward_ios,
                          name: 'My vehicles'),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(PaymentPage());
                      },
                      child: Setting_tile(
                          icn: Icons.add_card_sharp,
                          arrow: Icons.arrow_forward_ios,
                          name: 'My cards'),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ParkingHistory());
                      },
                      child: Setting_tile(
                        icn: Icons.history,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Parking history',
                      ),
                    ),
                    Setting_tile(
                      icn: Icons.fingerprint,
                      arrow: Icons.toggle_off_outlined,
                      name: 'Use fingerprint',
                    ),
                    Setting_tile(
                      name: '''
All saved fingerprints on this 
device will have access to this
account
      ''',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 275.h,
                width: 343.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 12,
                          color: Color.fromARGB(255, 179, 178, 178))
                    ]),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(CustomiseOption());
                      },
                      child: Setting_tile(
                          icn: Icons.edit_location,
                          arrow: Icons.arrow_forward_ios,
                          name: 'Customise parking options'),
                    ),
                    Setting_tile(
                        icn: Icons.location_on_outlined,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Available Locations'),
                    Setting_tile(
                        icn: Icons.question_mark_rounded,
                        arrow: Icons.arrow_forward_ios,
                        name: 'FAQ\'s'),
                    InkWell(
                      onTap: () {
                        Get.to(Feeback());
                      },
                      child: Setting_tile(
                        icn: Icons.feedback_outlined,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Give feedback',
                      ),
                    ),
                    Setting_tile(
                      icn: Icons.share,
                      arrow: Icons.arrow_forward_ios,
                      name: 'Share this app',
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Log out'))
            ],
          ),
        ),
      ),
    );
  }
}
