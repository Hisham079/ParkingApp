import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/app/modules/signinandSignup/view/signUp/view/signupPage.dart';
import 'package:parking/widget/regi_text_field.dart';
import '../../../../homePage/view/homePage.dart';
import '../bloc/authentication_bloc.dart';

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
      child: BlocListener<AuthenticationBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          } else if (state is LoginFailed) {
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
                                  // Text('Email'),
                                  RegTextField(
                                      controller: _loginemail, hint: 'Email'),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  //  const Text('Password'),
                                  RegTextField(
                                    controller: _loginpassword,
                                    hint: 'password',
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    //color: Colors.white,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(182, 5, 53, 93),
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
                                              password: _loginpassword.text,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Sign in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Dont have an account?'),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Signup(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
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
