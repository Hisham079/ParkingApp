import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking/app/infastructure/utils/validator.dart';
import 'package:parking/app/modules/signinandSignup/view/signUp/bloc/registration_bloc.dart';
import 'package:parking/app/modules/signinandSignup/view/signUp/local_widget/submit_button.dart';
import 'package:parking/app/modules/signinandSignup/view/sign_in/views/signIn.dart';
import 'package:parking/widget/regi_text_field.dart';

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
  // final _ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _cpasswordController = TextEditingController();
  final regBloc = RegistrationBloc(); //creating object of the

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => regBloc,
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSucces) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Loginpage(),
              ),
            );
          } else if (state is RegistrationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error_message),
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
            child: Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height.h,
                width: MediaQuery.of(context).size.width.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/images/carparking.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 231.8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(39.r),
                          color: Colors.white,
                        ),
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
                                      width: 30,
                                      height: 90,
                                      child: Text(
                                        ' New Account',
                                        style: TextStyle(
                                          fontSize: 29.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    RegTextField(
                                      controller: _fnameController,
                                      validator: Validators.noneEmptyValidator,
                                      hint: 'first name',
                                    ),
                                    RegTextField(
                                      controller: _lnameController,
                                      hint: 'last name',
                                      validator: Validators.noneEmptyValidator,
                                    ),
                                    RegTextField(
                                      controller: _emailController,
                                      hint: 'email',
                                      validator: Validators.emailValidator,
                                    ),
                                    RegTextField(
                                      controller: _passwordController,
                                      hint: 'Password',
                                      validator: Validators.passwordValidator,
                                    ),
                                    RegTextField(
                                      controller: _cpasswordController,
                                      hint: 'Confirm Password',
                                      validator: (p0) {
                                        if (_passwordController.text !=
                                            _cpasswordController.text) {
                                          return 'Password must be same';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    SubmitButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text('Processing Data'),
                                            ),
                                          );

                                          regBloc.add(
                                            RegisterEvent(
                                              email: _emailController.text,
                                              fname: _fnameController.text,
                                              lname: _lnameController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                        }
                                      },
                                      text: 'Sign up',
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Already have an account?'),
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
                                                    const Loginpage(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Login',
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
      ),
    );
  }
}
