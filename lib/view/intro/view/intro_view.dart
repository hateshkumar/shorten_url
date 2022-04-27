import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shorten/app_core/app_constants/app_colors.dart';
import 'package:shorten/app_core/app_constants/app_constants.dart';
import 'package:shorten/app_core/app_core.dart';
import 'package:shorten/view/home/bloc/home_bloc.dart';
import 'package:shorten/view/home/view/home_screen.dart';
import 'package:shorten/widget/app_spacers.dart';
import 'package:shorten/widget/button.dart';
import 'package:shorten/widget/decorations.dart';
import 'package:shorten/widget/image_util.dart';
import 'package:shorten/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderContentHolder> sliderList = [];
  int slideIndex = 0;
  PageController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderList = APPConstants.sliderList;
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: APPColors.appOffWhite,
        body: SafeArea(
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
                    fontSize: 8.w,
                    fontWeight: FontWeight.w700),
              ),
              SUSpacer(
                height: 3.h,
              ),
              Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  children: [
                    buildCenterWidget(context, sliderList[0]),
                    buildCenterWidget(context, sliderList[1]),
                    buildCenterWidget(context, sliderList[2]),
                  ],
                ),
              ),
              SUTextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => BlocProvider(
                              create: (context) => HomeBloc(),
                              child: const HomeScreen(),
                            )));
                  },
                  child: SUText.text(
                    text: "Skip",
                    fontSize: 18.sp,
                    color: Colors.black87,
                  )),
              SUSpacer(
                height: 5.h,
              ),
            ],
          ),
        ));
  }

  Widget buildCenterWidget(
      BuildContext context, SliderContentHolder sliderData) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: SUSpace.avatarRadius + SUSpace.padding,
                  bottom: SUSpace.padding,
                  left: SUSpace.padding,
                  right: SUSpace.padding,
                ),
                margin: const EdgeInsets.only(top: SUSpace.avatarRadius),
                decoration: SUDecorations.cicularWithShadowNwithoutBorder(
                    circularSpace: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    SUSpacer(
                      height: 2.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: SUText.text(
                        textAlign: TextAlign.center,
                        text: sliderData.title ?? "",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 5.w,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SUSpacer(
                      height: 2.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: SUText.text(
                        textAlign: TextAlign.center,
                        text: sliderData.desc ?? "",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 4.5.w,
                        ),
                      ),
                    ),
                    SUSpacer(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
              SUSpacer(
                height: 4.h,
              ),
              DotsIndicator(
                dotsCount: sliderList.length,
                position: slideIndex.toDouble(),
                decorator: const DotsDecorator(
                  activeSize: Size(12.0, 12.0),
                  size: Size(12.0, 12.0),
                  shape: CircleBorder(
                      side: BorderSide(color: APPColors.appTextGrey)),

                  color: APPColors.appOffWhite,
                  // Inactive color
                  activeColor: APPColors.appTextGrey,
                ),
              )
            ],
          ),
          Positioned(
            left: SUSpace.padding,
            right: SUSpace.padding,
            child: CircleAvatar(
              backgroundColor: APPColors.appPrimaryViolet,
              radius: SUSpace.avatarRadius,
              child: SvgLoader(
                imagePath: sliderData.image,
                width: 12,
                height: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
