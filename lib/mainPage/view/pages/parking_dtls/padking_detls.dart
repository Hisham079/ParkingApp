import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/spot_image.dart';
import 'package:parking/mainPage/view/pages/settings_pages/widget/btn_wdgt.dart';

class ParkingDetls extends StatefulWidget {
  const ParkingDetls({super.key});

  @override
  State<ParkingDetls> createState() => _ParkingDetlsState();
}

class _ParkingDetlsState extends State<ParkingDetls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'Assets/images/map1.jpg',
                        ),
                        fit: BoxFit.cover)),
                height: 300.h,
                width: 375.w,
              ),
              ListTile(
                title: Text('HiLite Parking'),
                subtitle: Text('5th,Calicut,Poovangal,Kerala 673014'),
                trailing: Text('20 Slots'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpotImage(image: 'Assets/images/carparking.jpg'),
                    SpotImage(image: 'Assets/images/parkingimage1.jpg'),
                    SpotImage(image: 'Assets/images/parkingimage2.jpg')
                  ],
                ),
              ),
              BtnWdgt(name: 'Select Date & Time', raduis: 10, clr: Colors.white),
              BtnWdgt(name: 'ChooseParking Slot', raduis: 10, clr: Colors.white)
            ],
          ),
        ),
        bottomNavigationBar: BtnWdgt(
          name: 'Reserve Now',
          raduis: 21,
          clr: Color.fromARGB(255, 76, 150, 115),
        ));
  }
}
