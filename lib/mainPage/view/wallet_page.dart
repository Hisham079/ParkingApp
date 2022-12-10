import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletPg extends StatelessWidget {
  const WalletPg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Text('Help'),],),
      body: Container(height: MediaQuery.of(context).size.height-200.h,
      width: MediaQuery.of(context).size.width-40.w,),
    );
  }
}