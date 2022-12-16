import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChooseSlot extends StatefulWidget {
  const ChooseSlot({super.key});

  @override
  State<ChooseSlot> createState() => _ChooseSlotState();
}

class _ChooseSlotState extends State<ChooseSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Parking Slot'),
      ),
    );
  }
}