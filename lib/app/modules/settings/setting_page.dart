// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking/app/modules/settings/payment/payment.dart';
import 'package:parking/app/modules/settings/profile/view/profile.dart';
import 'package:parking/app/modules/settings/theme/bloc/theme_bloc.dart';
import 'package:parking/app/modules/settings/theme/theme.dart';
import '../homePage/widget/settings_tile.dart';
import '../signinandSignup/view/sign_in/views/signIn.dart';
import 'my_vehicle.dart';
import 'notification.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, this.themeBloc, this.change});
  ThemeBloc? themeBloc;
  bool? change;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 73, 107),
        title: Text('Account Settings'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height.h,
            width: MediaQuery.of(context).size.width.w,
            color: Color.fromARGB(255, 241, 237, 237),
            child: Column(
              children: [
                Container(
                  height: 505.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 12,
                            color: Color.fromARGB(255, 174, 174, 174),)
                      ],),
                  child: Column(
                    children: [
                      Setting_tile(
                          ontap: Profile(),
                          icn: Icons.person,
                          arrow: Icons.arrow_forward_ios,
                          name: 'My Profile',),
                      Setting_tile(
                          ontap: MyVehicle(),
                          icn: FontAwesomeIcons.car,
                          arrow: Icons.arrow_forward_ios,
                          name: 'My vehicles',),
                      Setting_tile(
                          ontap: PaymentPage(),
                          icn: Icons.add_card_sharp,
                          arrow: Icons.arrow_forward_ios,
                          name: 'My cards',),
                      Setting_tile(
                        ontap: Notifications(),
                        icn: FontAwesomeIcons.bell,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Notification',
                      ),
                      Setting_tile(
                        icn: Icons.feedback_outlined,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Give feedback',
                      ),
                      Setting_tile(
                          icn: Icons.question_mark_rounded,
                          arrow: Icons.arrow_forward_ios,
                          name: 'FAQ\'s',),
                      Setting_tile(
                        icn: Icons.share,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Share this app',
                      ),
                      Setting_tile(
                        icn: Icons.language,
                        arrow: Icons.arrow_forward_ios,
                        name: 'Languages',
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ThemePage());
                        },
                        child: FocusedMenuHolder(
                          animateMenuItems: true,
                          onPressed: () {},
                          menuItems: <FocusedMenuItem>[
                            FocusedMenuItem(
                                title: Text('Light'), onPressed: () {},),
                            FocusedMenuItem(
                                backgroundColor: Colors.black87,
                                title: Text(
                                  'Dark',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  themeBloc!
                                      .add(ChangeThemeEvent(value: change!));
                                },)
                          ],
                          child: Setting_tile(
                            icn: FontAwesomeIcons.circleHalfStroke,
                            arrow: Icons.arrow_forward_ios,
                            name: 'Theme',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(39.r),
                              topRight: Radius.circular(39.r),
                            ),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height / 3,
                          width: 452.w,
                          child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                // Divider(thickness: 5,color: Color.fromARGB(127, 0, 0, 0),),
                                const Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Are you Sure Want to logout?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,),
                                  child: SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      highlightElevation: 0,
                                      textColor: Colors.white,
                                      color: const Color.fromARGB(
                                          255, 235, 219, 174,),
                                      child: const Text(
                                        'Yes , Logout',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Loginpage(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,),
                                  child: SizedBox(
                                    height: 50,
                                    child: SizedBox(
                                      width: 300,
                                      height: 50,
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black,),
                                            borderRadius:
                                                BorderRadius.circular(25),),
                                        highlightElevation: 0,
                                        textColor: Colors.white,
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                      height: 40.h,
                      width: 343.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: const Color.fromARGB(255, 31, 73, 107),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 12.r,
                                color: Color.fromARGB(255, 178, 177, 177),)
                          ],),
                      child: Center(
                          child: Text(
                        'Log out',
                        style: GoogleFonts.laila(
                            fontSize: 16.sp, color: Colors.white,),
                      ),),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
