import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetls extends StatelessWidget {
  const BookingDetls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border_sharp),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.ios_share))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 200.h,
                  width: MediaQuery.of(context).size.width - 150.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/images/parkingimage2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 200.h,
                  width: MediaQuery.of(context).size.width - 50.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('Assets/images/parkingimage5.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
           Padding(
            padding: EdgeInsets.only(right: 100),
            child: Text(
              '''
Patel Chowk Metro Station Gate
Number 1-Patel Chowk''',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 80, top: 5),
            child: Text(
              '''
Patel Chowk Metro Station Gate 1 Ashok
Road
''',
              style: TextStyle(color: Color.fromARGB(255, 123, 123, 123)),
            ),
          ),
          Row(
            children:  [
              Icon(Icons.show_chart_rounded),
              Text('1 km'),
              SizedBox(
                width: 10.w,
              ),
              Icon(Icons.car_crash),
              Text('₹30/6hr')
            ],
          ),
           Padding(
            padding: EdgeInsets.only(right: 130, top: 15),
            child: Text(
              'when do you want to park?',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 630.h,
            width: MediaQuery.of(context).size.width - 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color.fromARGB(255, 224, 224, 224)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 60, top: 10),
                      child: Text('In'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 60, top: 5),
                      child: Text('11:15 PM'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 60,
                      ),
                      child: Text('Wed, Oct 19'),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Icon(Icons.arrow_forward_ios),
                ),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 10, top: 12),
                      child: Text('Out'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text('01:15 AM'),
                    ),
                    Text('Thu, Oct 20'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 200.h,
          )
        ],
      ),
    );
  }
}
