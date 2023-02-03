import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void openCheckout(Razorpay razorpay) async {
  var options = {
    'key': 'rzp_test_cBg3QNQxpXaqIB',
    'amount': 100,
    'name': 'Parking Payment',
    'description': 'Payment method',
    'retry': {'enable': true, 'max_count': 1},
    'sent_sms_hash': true,
    'prefill': {'contact': '132454657', 'email': 'hisham@gmail.com'},
    'external': {
      'wallet': ['paytm']
    }
  };
  try {
    razorpay.open(options);
  } catch (e) {
    debugPrint('error:e');
  }
}
