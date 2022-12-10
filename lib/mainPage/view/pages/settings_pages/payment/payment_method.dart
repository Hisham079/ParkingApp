import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.check))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 60.h,
            width: 340.w,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Card number',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              SizedBox(
                height: 60.h,
                width: 170.w,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Expiry (MM/YY)',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                height: 60.h,
                width: 170.w,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'CVV',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 60.h,
            width: 340.w,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Cardholder\'s name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          )
        ],
      ),
    );
  }
}
