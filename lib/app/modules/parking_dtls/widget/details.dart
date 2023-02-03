import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';

class Details extends StatelessWidget {
  Details(
      {super.key,
      required this.name,
      required this.details2,
      required this.details,
      required this.name2});
  String name;
  String details;
  String name2;
  String details2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // dense: true,
      visualDensity: VisualDensity(vertical: 3),
      title: Text(
        name,
        style: TextStyle(color: Colors.grey),
      ),
      subtitle: Text(
        details,
        style: TextStyle(color: Colors.black),
      ),
      trailing: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              name2,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Text(details2),
        ],
      ),
    );
  }
}
