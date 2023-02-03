// import 'package:flutter/material.dart';

// class DropdownBtn extends StatefulWidget {
//   DropdownBtn({super.key, required this.items, required this.text});
//   List items;
//   final String text;

//   @override
//   State<DropdownBtn> createState() => _BookingsState();
// }

// class _BookingsState extends State<DropdownBtn> {
//   String? _dropDownValue;
//   // ignore: strict_raw_type
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromARGB(255, 141, 140, 140)),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
          
//           hint: Text(widget.text),
//           isExpanded: true,
//           iconSize: 30.0,
//           value: _dropDownValue,
//           style: TextStyle(color: Colors.blue),
//           items: widget.items.map((items) {
//             return DropdownMenuItem(
//               value: items,
//               child: Text(items.toString()),
//             );
//           }).toList(),
//           onChanged: (val) {
//             setState(
//               () {
//                 _dropDownValue = val.toString();
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
