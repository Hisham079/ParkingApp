import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../bookingDetails/repo/deleteBookings.dart';
import 'history.dart';

import 'ongoing/on_going.dart';

class MyBookings extends StatefulWidget {
  MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  // List<String> item = ['Bookings', 'History', 'Cancelled'];
  List<Widget> data = [OnGoing(), History(), History()];
  final taskRef = FirebaseFirestore.instance.collection('parkingDetails');
  final auth = FirebaseAuth.instance;

  int current = 0;
  @override
  Widget build(BuildContext context) {
    //  int? currentPageIndex;
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromARGB(255, 31, 73, 107),
                    
          title: Text(
            'My Booking',
            style: GoogleFonts.laila(fontWeight: FontWeight.w500),
          ),
        ),
        body: data[current],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.squareParking), label: 'Ongoing'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.cancel), label: 'Canceled'),
          ],
          currentIndex: current,
          onTap: (value) {
            setState(() {
              current = value;
            });
          },
        ));
  }
}
      // body: Container(
      //   margin: EdgeInsets.all(5),
      //   height: double.infinity,
      //   width: double.infinity,
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 70.h,
      //         width: double.infinity.w,
      //         child: ListView.builder(
      //           physics: BouncingScrollPhysics(),
      //           itemCount: item.length,
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) {
      //             return Column(
      //               children: [
      //                 Visibility(
      //                   visible: false,
      //                   child: Container(
      //                     height: 5.h,
      //                     width: 5.w,
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       color: Colors.deepPurpleAccent,
      //                     ),
      //                   ),
      //                 ),
      //                 GestureDetector(
      //                   onTap: () {
      //                     setState(() {
      //                       current = index;
      //                     });
      //                   },
      //                   child: Container(
      //                     margin: EdgeInsets.all(8),
      //                     height: 40.h,
      //                     width: 100.w,
      //                     decoration: BoxDecoration(
      //                       boxShadow: [
      //                         BoxShadow(
      //                             blurRadius: 4,
      //                             color: Color.fromARGB(255, 100, 99, 99))
      //                       ],
      //                       color: current == index
      //                           ? Colors.white
      //                           : Color.fromARGB(255, 250, 248, 248),
      //                       borderRadius: current == index
      //                           ? BorderRadius.circular(17)
      //                           : BorderRadius.circular(17),
      //                       border: current == index
      //                           ? null
      //                           : Border.all(
      //                               color: Color.fromARGB(255, 164, 163, 163),
      //                               width: 2.w,
      //                             ),
      //                     ),
      //                     child: Center(
      //                       child: Text(item[index],
      //                           style: GoogleFonts.laila(
      //                               color: current == index
      //                                   ? Color.fromARGB(179, 25, 20, 20)
      //                                   : Color.fromARGB(137, 110, 109, 109),
      //                               fontWeight: FontWeight.w500)),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             );
      //           },
      //         ),
      //       ),
      //       (data[current])
      //     ],
      //   ),
      //    ),
   

// class Test extends StatelessWidget {
//   const Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40.h,
//       width: 40.w,
//       color: Colors.yellow,
//     );
//   }
// }

// vehicle details

// Container(
//         height: MediaQuery.of(context).size.height.h,
//         width: MediaQuery.of(context).size.width.w,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 40.7),
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                           color: Color.fromARGB(255, 202, 201, 201),
//                           blurRadius: 15,
//                           blurStyle: BlurStyle.outer),
//                     ],
//                     borderRadius: BorderRadius.circular(39.r),
//                     color: Colors.white),
//                 height: MediaQuery.of(context).size.height - 200.h,
//                 width: MediaQuery.of(context).size.width - 65.w,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(left: 40, top: 30),
//                           height: 140.h,
//                           width: 150.w,
//                           child: Text(
//                             'Details',
//                             style: TextStyle(
//                                 fontSize: 29.sp,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height - 70.h,
//                         width: MediaQuery.of(context).size.width - 110.w,
//                         child: ListView(
//                           scrollDirection: Axis.vertical,
//                           children: [
//                             TextField(
//                               decoration:
//                                   InputDecoration(hintText: 'Location'),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             TextField(
//                               decoration: InputDecoration(
//                                   // icon: Icon(Icons.key),
//                                   hintText: 'Vehicle Type'),
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             TextField(
//                               decoration: InputDecoration(
//                                   // icon: Icon(Icons.key),
//                                   hintText: 'Vehicle Number'),
//                             ),
//                              SizedBox(
//                               height: 10.h,
//                             ),
//                             TextField(
//                               decoration: InputDecoration(
//                                   // icon: Icon(Icons.key),
//                                   hintText: 'RC number'),
//                             ),
//                              SizedBox(
//                               height: 10.h,
//                             ),
//                             TextField(
//                               decoration: InputDecoration(
//                                   // icon: Icon(Icons.key),
//                                   hintText: 'Licence Number'),
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Container(
//                               //color: Colors.white,
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Color.fromARGB(255, 234, 141, 59),
//                                     minimumSize: Size(270, 50),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50.r),
//                                     ),
//                                   ),
//                                   onPressed: () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => BookingDetls(),
//                                       )),
//                                   child:  Text(
//                                     'Submit',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 17.sp),
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // color: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
