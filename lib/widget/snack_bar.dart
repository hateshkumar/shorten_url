import 'package:flutter/material.dart';
import 'package:shorten/app_core/app_core.dart';
import 'package:shorten/widget/text_widget.dart';

import 'package:sizer/sizer.dart';

class SUSnackBar extends SnackBar {
  SUSnackBar.critical(
      {Key? key,
      @required this.caption,
      this.sweechSnackbarAction,
      this.bg =  APPColors.appRed,
      this.style})
      : super(
            key: key,
            content: SUText.text(
              text: caption!,
              style: style,
              color: APPColors.appWhite,
              fontSize: 9.sp,
            ),
            backgroundColor: bg,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
                right: SUSpace.horizontal,
                left: SUSpace.horizontal,
                bottom: 2.h),
            action: sweechSnackbarAction);

  SUSnackBar(
      {Key? key,
      required this.caption,
      this.sweechSnackbarAction,
      this.bg = const Color(0xFF616161),
      this.style})
      : super(
            key: key,
            content: SUText.text(
              text: caption!,
              style: style,
              color: APPColors.appWhite,
              fontSize: 9.sp,
            ),
            backgroundColor: bg,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
                right: SUSpace.horizontal,
                left: SUSpace.horizontal,
                bottom: 2.h),
            action: sweechSnackbarAction);

  final String? caption;
  final TextStyle? style;
  final Color bg;
  final SnackBarAction? sweechSnackbarAction;
}
