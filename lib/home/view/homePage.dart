import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:parking/signUp/view/signupPage.dart';

import '../../sign_in/views/sign.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height.h,
        width: MediaQuery.of(context).size.width.w,
        decoration:const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/images/underpark.jpg'),
                fit: BoxFit.cover),), 
        child: Column(
          children: [
           // AssetImage(''),
            Padding(
              padding:const EdgeInsets.only(right: 240, top: 100),
              child: Container(
                height: 140.h,
                width: 110.w,
                child: Text(
                  'Park safe with me',
                  style: TextStyle(
                      fontSize: 29.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 234, 141, 59),
                      minimumSize: Size(270, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(270, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginpage(),
                            ));
                      },
                      child:  Text(
                        'Sign in',
                        style: TextStyle(
                            color: Color.fromARGB(255, 226, 129, 10),
                            fontSize: 17.sp),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
