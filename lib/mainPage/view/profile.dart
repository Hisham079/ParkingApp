import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),actions: [
        Icon(Icons.notifications)
      ],),
      body:Column(
        children: [
          Container(
            height: 80.h,
            width: 200.w,
            child: Center(
              child: Icon(Icons.person),
            ),
            
          ),
          Text('Hisham'),
          Text('7034404247')
        ],
      ) ,
    );
  }
}