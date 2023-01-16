// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// class NeumoButton extends StatefulWidget {
//   NeumoButton({super.key});

//   @override
//   State<NeumoButton> createState() => _NeumoButtonState();
// }

// class _NeumoButtonState extends State<NeumoButton> {
//   bool isPressed = true;

//   @override
//   Widget build(BuildContext context) {
//     final backgroundColor = Color(0xFFE7ECEF);

//     Offset distance =isPressed?Offset(10,10):Offset(28, 28);

//     double blur =isPressed?5: 30;
//     return GestureDetector(
//       onTap: () => setState(() =>isPressed=!isPressed),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 100),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: backgroundColor,
//               boxShadow: [
//                 BoxShadow(
//                     inset: true,
//                     offset: distance,
//                     blurRadius: blur,
//                     color: Colors.white),
//                 BoxShadow(
//                     inset: true,
//                     offset: distance,
//                     blurRadius: blur,
//                     color: Color(0xFFA7A9AF))
//               ]),
//           child: SizedBox(
//             height: 200,
//             width: 200,
//           )),
//     );
//   }
// }
