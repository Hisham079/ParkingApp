import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/booking_confirmation.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/date_time.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/spot_image.dart';
import 'package:parking/mainPage/view/pages/settings_pages/widget/btn_wdgt.dart';

// ignore: must_be_immutable
class ParkingDetls extends StatefulWidget {
  ParkingDetls({super.key});
  bool isLoading = false;

  @override
  State<ParkingDetls> createState() => _ParkingDetlsState();
}

class _ParkingDetlsState extends State<ParkingDetls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: widget.isLoading,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'Assets/images/map1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 300.h,
                width: 375.w,
              ),
              const ListTile(
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
              BtnWdgt(
                name: 'Select Date & Time',
                raduis: 10,
                clr: Colors.white,
                ontap: const DateAndTime(),
              ),
              // BtnWdgt(
              //   name: 'ChooseParking Slot',
              //   raduis: 10,
              //   clr: Colors.white,
              //   ontap: DateAndTime(),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BtnWdgt(
        name: 'Reserve Now',
        raduis: 21,
        clr: const Color.fromARGB(255, 76, 150, 115),
        ontap: BookingConfirmation(),
      ),
    );
  }
}
