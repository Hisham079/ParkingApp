import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ParkingHistory extends StatelessWidget {
  const ParkingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking History'),
        actions: [
          TextButton(onPressed: () {
            
          }, child: Text('DELETE ALL'))
        ]
        ,
      ),
      body: Text('''
Parking Details and receipts are only 
available for transactions that were made
through this app, not the mete .Learn 
more.
'''),
    );
  }
}