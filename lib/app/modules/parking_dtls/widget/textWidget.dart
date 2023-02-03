import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWdgt extends StatelessWidget {
  TextWdgt({super.key, required this.txt, required this.txt2});
  String txt;
  String txt2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: GoogleFonts.libreFranklin(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Text(
            txt2,
            style: GoogleFonts.libreFranklin(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
