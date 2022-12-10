import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parking/mainPage/view/pages/settings_pages/payment/payment_method.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(PaymentMethod());
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
