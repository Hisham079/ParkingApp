import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Vehicle extends StatelessWidget {
  const Vehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      child: Column(children: [
        Row(children: [
          Container(
            height: 40,
            width: 30,
            color: Colors.yellow,
          )
        ],)
      ],),
    );
  }
}