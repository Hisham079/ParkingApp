import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/home/view/homePage.dart';

import 'package:parking/sign_in/views/signIn.dart';

import '../../sign_in/bloc/authentication_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _lnameController = TextEditingController();
  final _fnameController = TextEditingController();
  final _ageController = TextEditingController();

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
                          Expanded(
                            child: Container(
                              height: 350.h,
                              width: 330.w,
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 90,
                                    child: Text(
                                      '''
New 
Account''',
                                      style: TextStyle(
                                          fontSize: 29.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: CupertinoTextField(
                                      controller: _fnameController,
                                      placeholder: 'first name',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: CupertinoTextField(
                                      controller: _lnameController,
                                      placeholder: 'last name',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: CupertinoTextField(
                                      controller: _emailController,
                                      placeholder: 'Email',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: CupertinoTextField(
                                      controller: _ageController,
                                      placeholder: 'Age',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: CupertinoTextField(
                                      controller: _passwordController,
                                      placeholder: 'Password',
                                    ),
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
                                                  email: _emailController.text,
                                                  password: _passwordController
                                                      .text));
                                            },
                                            child: Text(
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
