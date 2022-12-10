
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:parking/mainPage/view/mainPage.dart';
import 'package:parking/sign_in/bloc/authentication_bloc.dart';

import '../../signUp/view/signupPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _loginemail = TextEditingController(),
      _loginpassword = TextEditingController();
  final auth_bloc = AuthenticationBloc(); //creating object of the

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => auth_bloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
          } else if(state is LoginFailed){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error_message)));
          }
        },
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Login'),
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
                padding: const EdgeInsets.only(top: 232.0),
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
                                height: 140.h,
                                width: 150.w,
                                child: Text(
                                  'Sign  in',
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
                                    controller: _loginemail,
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.mail_outline),
                                        hintText: 'abcd@gmail.com'),
                                  ),
                                   SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text('Password'),
                                  TextField(
                                    controller: _loginpassword,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.key),
                                      hintText: '*****',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    //color: Colors.white,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                       const     Color.fromARGB(255, 234, 141, 59),
                                        minimumSize: Size(270, 50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: GestureDetector(
                                        onTap: () {
                                          auth_bloc.add(
                                            UserLoginEvent(
                                                email: _loginemail.text,
                                                password: _loginpassword.text),
                                          );
                                        },
                                        child:  Text(
                                          'Sign in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 // Text('sign in with')
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
