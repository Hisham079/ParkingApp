import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegTextField extends StatelessWidget {
  RegTextField(
      {super.key, required this.controller, this.validator, this.hint,
      this.text,});
  TextEditingController controller;
  String? Function(String?)? validator;
  String? hint;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: hint,
              hintText: text),
        ),
      ),
    );
  }
}
