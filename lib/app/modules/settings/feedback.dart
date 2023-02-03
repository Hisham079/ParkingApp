import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Feeback extends StatelessWidget {
  const Feeback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
        title: Text('Give feedback'),
      ),
      body: Container(
        height: 600.h,
        width: 400.w,
        child: Column(
          children: [
            Text(style: TextStyle(fontSize: 19), '''
What would you like to see in Park'nPay 
and what could we do better?
'''),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'Feedback',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
