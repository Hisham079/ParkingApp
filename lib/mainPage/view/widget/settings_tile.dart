import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Setting_tile extends StatelessWidget {
  Setting_tile(
      {super.key,  this.icn, required this.name,  this.arrow});
  IconData? icn;
  String? name;
  IconData? arrow;
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        
        leading: Icon(icn),
        title: Text(name.toString()),
        trailing: Icon(arrow),
      ),
    );
  }
}
