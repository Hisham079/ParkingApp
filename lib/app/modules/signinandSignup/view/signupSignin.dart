import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/app/modules/signinandSignup/view/signUp/view/signupPage.dart';
import 'package:parking/app/modules/signinandSignup/view/sign_in/views/signIn.dart';
import '../../homePage/view/homePage.dart';

class SigninSignupPage extends StatefulWidget {
  const SigninSignupPage({super.key});
  @override
  State<SigninSignupPage> createState() => SigninSignState();
}

class SigninSignState extends State<SigninSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/images/underpark.jpg'),
              fit: BoxFit.cover,),
        ),
        child: Column(
          children: [
            // AssetImage(''),
            Padding(
              padding: const EdgeInsets.only(right: 240, top: 100),
              child: Container(
                height: 140.h,
                width: 110.w,
                child: Text(
                  'Park safe with me',
                  style: TextStyle(
                      fontSize: 29.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,),
                ),
              ),
            ),
            Container(
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 31, 73, 107),
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
                            ),);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),),
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
                            ),);
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 31, 73, 107),
                            fontSize: 17.sp,),
                      ),
                    ),),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),);
                },
                child: Text('For Test'),)
          ],
        ),
      ),
    );
  }
}
