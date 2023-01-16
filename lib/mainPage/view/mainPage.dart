import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/mainPage/view/pages/bookingDetails/view/bookingDetails.dart';
import 'package:parking/mainPage/view/pages/myBookings/view/my_booking.dart';
import 'package:parking/mainPage/view/pages/myBookings/view/ongoing/on_going.dart';
import 'package:parking/mainPage/view/pages/parking_dtls/padking_detls.dart';
import 'package:parking/mainPage/view/pages/settings_pages/setting_page.dart';
import 'package:parking/mainPage/view/pages/settings_pages/widget/btn_wdgt.dart';
import 'package:parking/mainPage/view/widget/near_space.dart';
import 'package:parking/mainPage/view/widget/category.dart';
import 'package:parking/mainPage/view/pages/wish_list/wish_list.dart';
import 'package:parking/parkingSlot/view/parkingSlot.dart';

import 'pages/myBookings/view/history.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: 635.h,
          width: 375.w,
          color: Colors.black,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('Assets/images/carparking.jpg'),
                    ),
                  ),
                  Text(
                    'Hi HISHAM',
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Icon(
                        Icons.list_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150, top: 10),
                child: Text(
                  '''
Let's find the best
Parking space
          ''',
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 24.sp),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      6.r,
                    ),
                    color: Color.fromARGB(255, 29, 26, 26)),
                height: 35.h,
                width: 338.w,
                child: CupertinoSearchTextField(
                  prefixIcon: Icon(CupertinoIcons.search),
                  placeholder: 'Find Parking Area',
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  style: TextStyle(color: Color.fromARGB(255, 201, 200, 200)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 430.4.h,
                width: 375.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(
                          initialScrollOffset: 0, keepScrollOffset: true),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(95, 223, 221, 221),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 190.h,
                          width: 360.w,
                          child: Ad()),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyBookings(),
                              )),
                          child: Category(icn: Icons.local_parking, name: '''
 My 
  Booking
                          '''),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WishList(),
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookingDetails(),
                                  ));
                            },
                            child: Category(
                              icn: Icons.now_widgets_sharp,
                              name: '''
                                    
      Book my
      Parking''',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingDetails(),
                                ));
                          },
                          child: Category(
                            icn: Icons.align_horizontal_left_sharp,
                            name: '''
          Other
          services''',
                          ),
                        ),
                      ],
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(right: 230, top: 10),
                    //   child: Text(
                    //     'Nearby Space',
                    //     style: TextStyle(
                    //         fontSize: 15.sp,
                    //         fontWeight: FontWeight.bold,
                    //         color: Color.fromARGB(255, 122, 122, 122)),
                    //   ),
                    // ),
                    // Expanded(
                    //     child: ListView.builder(
                    //   itemCount: 3,
                    //   itemBuilder: (context, index) {
                    //     return GestureDetector(
                    //         onTap: () {
                    //           Get.to(ParkingDetls());
                    //         },
                    //         child: NearSpace());
                    //   },
                    // )),
                    BtnWdgt(
                        textClr: Colors.black,
                        name: 'Parking slots',
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParkingSlot(),
                              ));
                        },
                        raduis: 7,
                        clr: Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:parking/mainPage/view/accnt_settings.dart';
// import 'package:parking/mainPage/view/home_page.dart';
// import 'package:parking/mainPage/view/profile.dart';
// import 'package:parking/mainPage/view/widget/parking_dtls.dart';
// import 'package:parking/myBookings/view/vehclDetails.dart';
// import 'package:parking/status_page/view/statusPage.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height.h,
//           width: MediaQuery.of(context).size.width.w,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Profile(),
//                           ));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 22, top: 60),
//                       child: CircleAvatar(
//                         backgroundImage:
//                             AssetImage('Assets/images/carparking.jpg'),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 5, top: 50),
//                     child: Text('Hi hisham'),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 187, top: 50),
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AccntSettings(),
//                               ));
//                         },
//                         child: Icon(Icons.list_outlined)),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 5),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(9),
//                       color: Color.fromARGB(255, 241, 241, 241)),
//                   height: 53.h,
//                   width: 338.w,
//                   //color: Color.fromARGB(255, 253, 239, 239),
//                   child: TextField(
//                     decoration: InputDecoration(
//                         icon: Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Icon(Icons.search),
//                         ),
//                         hintText: 'Search location',
//                         border: InputBorder.none),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10.w,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 controller: ScrollController(
//                     initialScrollOffset: 0, keepScrollOffset: true),
//                 child: Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(95, 223, 221, 221),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     height: 140.h,
//                     width: 340.w,
//                     child: Ad()),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Column(
//                 children: [
//                   Container(
//                     height: 120.h,
//                     width: 380.w,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         InkWell(
//                           onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MyBookings(),
//                               )),
//                           child: ParkingDtls(icn: Icons.local_parking, name: '''
//   Book my
//   parking
//                         '''),
//                         ),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const StatusPage(),
//                               ),
//                             );
//                           },
//                           child: ParkingDtls(
//                             icn: Icons.change_history_outlined,
//                             name: 'Status',
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => HomePage(),
//                                 ));
//                           },
//                           child: ParkingDtls(
//                             icn: Icons.align_horizontal_left_sharp,
//                             name: '''
// Other
// services''',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Ad extends StatelessWidget {
  const Ad({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true),
      items: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.91IrX37gajNsU6d8iypWgAHaED?pid=ImgDet&rs=1'),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(
                    'https://integralads.com/wp-content/uploads/2021/12/IAS_Home-Page-1-scaled.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        // Image.network(
        //   'https://th.bing.com/th/id/OIP.91IrX37gajNsU6d8iypWgAHaED?pid=ImgDet&rs=1',
        //   fit: BoxFit.fill,
        // ),
        // Image.network(
        //   'https://integralads.com/wp-content/uploads/2021/12/IAS_Home-Page-1-scaled.jpg',
        //   fit: BoxFit.fill,
        // )
      ],
    );
  }
}
