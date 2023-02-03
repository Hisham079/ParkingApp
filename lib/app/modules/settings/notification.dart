import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking/app/modules/settings/widget/notification_widget.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          backgroundColor:const Color.fromARGB(255, 31, 73, 107),
                    
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Today'),
            ),
            Notifictn_wdgt(
              name: 'Payment Successful!',
              data: 'Parking booking at portaly was succes',
              icn: FontAwesomeIcons.circleCheck,
              clr: Colors.green,
            ),
            Notifictn_wdgt(
              name: 'Payment Failed!',
              data: 'You have canced parking',
              icn: FontAwesomeIcons.circleXmark,
              clr: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Yesterday'),
            ),
            Notifictn_wdgt(
              name: 'Payment Successful!',
              data: 'Parking booking at portaly was succes',
              icn: FontAwesomeIcons.circleCheck,
              clr: Colors.green,
            ),
          ],
        ));
  }
}
