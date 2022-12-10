import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking/mainPage/view/widget/settings_tile.dart';

class CustomiseOption extends StatelessWidget {
  const CustomiseOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customise parking options'),
      ),
      body: Column(
        children: [
          Setting_tile(icn: Icons.ev_station, name: 'EV chargers'),
          Setting_tile(
              icn: FontAwesomeIcons.hardDrive, name: 'Parkhound driveways'),
          Setting_tile(
              icn: FontAwesomeIcons.squareParking, name: 'commuter car parks'),
          Setting_tile(
              icn: Icons.accessible_sharp, name: 'Accessible parking spaces'),
        ],
      ),
    );
  }
}
