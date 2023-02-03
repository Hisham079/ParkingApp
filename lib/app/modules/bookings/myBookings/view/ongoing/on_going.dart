import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:parking/razorpay/checkOUt.dart';

import '../../../bookingDetails/repo/deleteBookings.dart';
import 'extend_time.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OnGoing extends StatefulWidget {
  OnGoing({super.key});

  @override
  State<OnGoing> createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  final taskRef = FirebaseFirestore.instance.collection('parkingDetails');
  final auth = FirebaseAuth.instance;

  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds;
      reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  //razorpay

  late Razorpay _razorpay;
  @override
  // void dispose() {
  //   super.dispose();
  //   _razorpay.clear();
  // }

  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS:" + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR" + response.code.toString(),
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET:" + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(64));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
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
                              'TIME NEEDED: ${task_data[index]['timeForParking'].toString()} HOURS',
                              style: GoogleFonts.lexendDeca(fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'REMAINING TIME:${hours + payment.toString()}:$minutes:$seconds',
                              style: GoogleFonts.lexendDeca(fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'PAYMENT:₹ ${payment * 5}',
                              style: GoogleFonts.lexendDeca(fontSize: 14),
                            ),
                          ),
                          ExtendTime()
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              onPressed: startTimer, child: Text('Start')),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color.fromARGB(182, 5, 53, 93))),
                              onPressed: () {
                                DeleteBooking().deleteTask(
                                    userId: task_data[index]['parkingId']
                                        .toString());
                              },
                              child: Text('Cancel')),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Color.fromARGB(182, 5, 53, 93))),
                              onPressed: () {
                                openCheckout(_razorpay);
                              },
                              child: Text('Pay')),
                        ],
                      )
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
