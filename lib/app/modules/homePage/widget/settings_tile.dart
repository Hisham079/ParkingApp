import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Setting_tile extends StatelessWidget {
  Setting_tile(
      {super.key, this.icn, required this.name, this.arrow, this.ontap});
  IconData? icn;
  String? name;
  IconData? arrow;
  Widget? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Get.to(ontap);
        },
        child: ListTile(
          leading: Icon(icn),
          title: Text(name.toString()),
          trailing: Icon(arrow),
        ),
      ),
    );
  }
}
