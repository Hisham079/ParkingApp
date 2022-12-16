import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WishList extends StatefulWidget {
  WishList({super.key});

  @override
  State<WishList> createState() => _StatusPageState();
}

class _StatusPageState extends State<WishList> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 76, 150, 115),
        title: Text('My Wish List'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  6.r,
                ),
                color: Colors.white),
            height: 45.h,
            width: 340.w,
            child: CupertinoSearchTextField(
              prefixIcon: Icon(CupertinoIcons.search),
              placeholder: 'Search',
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              style: TextStyle(color: Color.fromARGB(255, 201, 200, 200)),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 115.h,
                      width: 340.w,

                      //color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Color.fromARGB(255, 212, 212, 212)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 14, right: 10),
                                child: Stack(children: [
                                  Container(
                                    height: 90.h,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.r),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 7,
                                            color: Colors.white24)
                                      ],
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://img.staticmb.com/mbcontent//images/uploads/2022/9/should-you-pay-extra-for-parking-spaces.jpg'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ]),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 13.h,
                                  ),
                                  Text('Booking ID:P0346571655',
                                      style: GoogleFonts.laila(
                                          fontWeight: FontWeight.w500)),
                                  Text('HiLite Bussiness Park',
                                      style: GoogleFonts.laila()),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        '24,Palazhi Road,Calicut',
                                        style: GoogleFonts.laila(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  icon: current == index
                                      ? Icon(
                                          Icons.bookmark,
                                        )
                                      : Icon(Icons.bookmark_border))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
