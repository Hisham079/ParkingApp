import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ParkingSlot extends StatelessWidget {
  ParkingSlot({super.key});
  bool flag = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
         GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: 32,
          itemBuilder: (ctx, i) {
            return Card(
              child: Container(
                height: 20,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                // margin: EdgeInsets.all(5),
                // padding: EdgeInsets.all(5),
                child: Container(
                  color:flag?  Colors.red:Colors.white,
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 5,
            //   mainAxisExtent: 164,
          ),
        ),
      ),
    );
  }
}
