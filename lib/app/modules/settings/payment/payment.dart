import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:parking/app/modules/settings/payment/payment_method.dart';

import '../widget/notification_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
        title: Text('Payment Methods'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(PaymentMethod());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Notifictn_wdgt(
          name: 'Paypal',
          data: 'xxxx xxxx xxxx 2354',
          icn: FontAwesomeIcons.paypal,
          clr: Colors.blue),
    );
  }
}
