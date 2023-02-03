import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/history_widget.dart';

class History extends StatelessWidget {
  History({super.key});
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
          return ListView.builder(
            // physics: ScrollPhysics(),
            // shrinkWrap: true,
            itemCount: task_data.length,
            itemBuilder: (context, int index) {
               int payment =
                  int.parse(task_data[index]['timeForParking'].toString());
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
                // height: 235,
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'VEHICLE NO:   ${task_data[index]['vehicleNo'].toString()}',
                              style: GoogleFonts.lexendDeca(fontSize: 14),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     'LICENCE NO:   ${task_data[index]['licenceNo'].toString()}',
                          //     style: GoogleFonts.lexendDeca(fontSize: 16),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'VEHICLE TYPE:${task_data[index]['vehicleType'].toString()}',
                              style: GoogleFonts.lexendDeca(fontSize: 16),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     'ADDRESS:        ${task_data[index]['adress'].toString()}',
                          //     style: GoogleFonts.lexendDeca(fontSize: 16),
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'TIME BOOKED: ${task_data[index]['timeForParking'].toString()} HOURS',
                              style: GoogleFonts.lexendDeca(fontSize: 14),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     'REMAINING TIME:$hours:$minutes:$seconds',
                          //     style: GoogleFonts.lexendDeca(fontSize: 14),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'PAYMENT:₹ ${payment*5}',
                              style: GoogleFonts.lexendDeca(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
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
