import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'time.dart';

class OnGoing extends StatelessWidget {
  OnGoing({super.key});
  final taskRef = FirebaseFirestore.instance.collection('parkingDetails');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: taskRef
          // .where('parkingId', isEqualTo: auth.currentUser!.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final task_data = snapshot.data!.docs;
          return Expanded(
            child: ListView.builder(
              itemCount: task_data.length,
              itemBuilder: (context, int index) {
                return SizedBox(
                  height: 200,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Vehicle no:${task_data[index]['vehicleNo'].toString()}'),
                    ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Licence no:${task_data[index]['licenceNo'].toString()}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'VehicleType:${task_data[index]['vehicleType'].toString()}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Address:${task_data[index]['adress'].toString()}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'TimeForParking:${task_data[index]['timeForParking'].toString()}'),
                    ),
                  ]),
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}












































//  Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 200.h,
//         width: 340.w,
//         //color: Colors.white,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12.r),
//             color: Color.fromARGB(255, 212, 212, 212)),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 14, top: 10, right: 18),
//                   child: Container(
//                     height: 102.h,
//                     width: 90.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(18.r),
//                       boxShadow: [
//                         BoxShadow(blurRadius: 7, color: Colors.white24)
//                       ],
//                       color: Colors.white,
//                       image: DecorationImage(
//                           image: NetworkImage(
//                               'https://img.staticmb.com/mbcontent//images/uploads/2022/9/should-you-pay-extra-for-parking-spaces.jpg'),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 13.h,
//                     ),
//                     Text('Booking ID:P0346571655',
//                         style: GoogleFonts.laila(fontWeight: FontWeight.w500)),
//                     Text('HiLite Bussiness Park', style: GoogleFonts.laila()),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on_outlined),
//                         Text(
//                           '24,Palazhi Road,Calicut',
//                           style: GoogleFonts.laila(),
//                         ),
//                       ],
//                     ),
//                     TextButton(
//                         style: ButtonStyle(
//                             foregroundColor:
//                                 MaterialStateProperty.all(Colors.white),
//                             backgroundColor: MaterialStateProperty.all(
//                                 Color.fromARGB(255, 76, 150, 115))),
//                         onPressed: () {},
//                         child: const Text('HiLite Bussiness Park'))
//                   ],
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 123),
//               child: Text(
//                 'Time Remaining :02:12:10',
//                 style: GoogleFonts.laila(
//                     fontWeight: FontWeight.w500, fontSize: 16),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.white),
//                     ),
//                     onPressed: () {
//                       Get.to(Time());
//                     },
//                     child: Text(
//                       'View Time',
//                       style: GoogleFonts.laila(color: Colors.black),
//                     )),
//                 SizedBox(
//                   width: 30.w,
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                           Color.fromARGB(255, 76, 150, 115)),
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'View Ticket',
//                       style: GoogleFonts.laila(),
//                     ),)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
