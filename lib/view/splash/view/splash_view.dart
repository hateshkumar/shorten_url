import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shorten/app_core/app_constants/app_colors.dart';
import 'package:shorten/app_core/app_constants/app_constants.dart';
import 'package:shorten/view/home/view/home_screen.dart';
import 'package:shorten/view/intro/view/intro_view.dart';
import 'package:shorten/widget/app_spacers.dart';
import 'package:shorten/widget/button.dart';
import 'package:shorten/widget/image_util.dart';
import 'package:shorten/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: APPColors.appWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SUSpacer(
                  height: 3.h,
                ),
                SUText.text(
                  textAlign: TextAlign.center,
                  text: APPConstants.app_name,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.w,
                      fontWeight: FontWeight.w700),
                ),
                const SvgLoader(
                  imagePath: APPConstants.illustration,
                  width: 150,
                  height: 46,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: SUText.text(
                    textAlign: TextAlign.center,
                    text: APPConstants.p1,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 7.5.w,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SUSpacer(),
                Container(
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: SUText.text(
                    textAlign: TextAlign.center,
                    text: APPConstants.p2,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 4.2.w,
                    ),
                  ),
                ),
                SUSpacer(
                  height: 4.h,
                ),
                Center(
                  child: SUElevatedButton(
                      buttonWidth: 70.w,
                      buttonHeight: 5.7.h,
                      buttonText: APPConstants.start,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => const IntroScreen()));
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
