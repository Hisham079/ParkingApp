import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/app/modules/settings/widget/vehicle.dart';

class MyVehicle extends StatefulWidget {
  MyVehicle({
    super.key,
  });

  @override
  State<MyVehicle> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicle> {
  //String selected = 'First';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
        title: Text('My Vehicle'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // setState(() {
              //   selected = 'First';
              // });
            },
            child: Vehicle(
                vcl_name: 'Toyota Labnd cruiser',
                vcl_no: 'KL18 3496',
                clr: Colors.black
                //selected == 'First' ? : Colors.transparent,
                ),
          ),
          GestureDetector(
            onTap: () {
              // setState(() {
              //   selected = 'Second';
              // });
            },
            child: Vehicle(
                vcl_name: 'Maruthi Suzuki Alto',
                vcl_no: 'KL18 5467',
                clr: Colors.black
                // selected == 'Second' ?
                // : Colors.transparent,
                ),
          ),
        ],
      ),
    );
  }
}
