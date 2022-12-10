import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/home/view/homePage.dart';

import 'package:parking/sign_in/views/sign.dart';

import '../../sign_in/bloc/authentication_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final email = TextEditingController();
  final password = TextEditingController();
  final uname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth_bloc = SignupBloc(); //creating object of the

    return BlocProvider(
      create: (context) => auth_bloc,
      child: BlocListener<SignupBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginpage(),
                ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Register Failed'),
              ),
            );
          }
        
        },
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   // title: Text('Signup'),
          // ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height.h,
              width: MediaQuery.of(context).size.width.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/carparking.jpg'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(top: 231.8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(39.r),
                          color: Colors.white),
                      height: 480.h,
                      width: 452.w,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 40, top: 30),
                                height: 110.h,
                                width: 150.w,
                                child: Text(
                                  'New Account',
                                  style: TextStyle(
                                      fontSize: 29.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height - 80.h,
                              width: MediaQuery.of(context).size.width - 80.w,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Text('Email'),
                                  TextField(
                                    controller: email,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.mail_outline),
                                        hintText: 'abcd@gmail.com'),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text('Username'),
                                  TextField(
                                    controller: uname,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.person),
                                        hintText: 'Alice'),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text('Password'),
                                  TextField(
                                    controller: password,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.key),
                                        hintText: '*****'),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    //color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 234, 141, 59),
                                            minimumSize: Size(270, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: GestureDetector(
                                            onTap: () {
                                              auth_bloc.add(UserRegisterEvent(
                                                  email: email.text,
                                                  password: password.text));
                                            },
                                            child:  Text(
                                              'Sign up',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17.sp),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      // color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
















//Container(
      //   color: Color.fromARGB(255, 227, 227, 227),
      //   child: Column(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.all(12),
      //         height: 40,
      //         width: 375,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(9),
      //           color: Color.fromARGB(255, 253, 253, 253),
      //         ),
      //         child: TextField(
      //           decoration: InputDecoration(
      //               hintText: '  Email address', border: InputBorder.none),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.all(12),
      //         height: 40,
      //         width: 375,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(9),
      //           color: Color.fromARGB(255, 253, 253, 253),
      //         ),
      //         child: TextField(
      //           decoration: InputDecoration(
      //               hintText: '  Mobile number', border: InputBorder.none),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.all(12),
      //         height: 40,
      //         width: 375,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(9),
      //           color: Color.fromARGB(255, 253, 253, 253),
      //         ),
      //         child: TextField(
      //           decoration: InputDecoration(
      //               hintText: '  Set a password', border: InputBorder.none),
      //         ),
      //       ),
      //       ElevatedButton(onPressed: (() {}), child: Text('Signup')),
      //       GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => Loginpage(),
      //                 ));
      //           },
      //           child: Text('or Login ?'))
      //     ],
      //   ),
      // ),











