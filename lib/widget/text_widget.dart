import 'package:flutter/material.dart';
import 'package:shorten/app_core/app_core.dart';
import 'package:sizer/sizer.dart';

class SUText extends Text {
  const SUText(String data, {Key? key})
      : super(
          data,
          key: key,
        );

  SUText.headerText(
      {Key? key,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextStyle? style,
      TextOverflow? overflow})
      : super(
          text,
          key: key,
          maxLines: overflow != null ? 2 : null,
          style: style ??
              TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: fontSize ?? 4.h,
                fontWeight: fontWeight ?? FontWeight.w500,
                color: color ?? APPColors.appBlack,
                overflow: overflow,
              ),
        );
  SUText.subHeadertext(
      {Key? key,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? textAlign,
      TextStyle? style,
      TextOverflow? overflow})
      : super(
          text,
          key: key,
          textAlign: textAlign,
          maxLines: overflow != null ? 2 : null,
          style: style ??
              TextStyle(
                fontFamily: 'Poppins',
                fontSize: fontSize ?? 2.h,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? APPColors.appTextGrey,
                overflow: overflow,
              ),
        );
  SUText.text(
      {Key? key,
      required String text,
      double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextStyle? style,
      TextDecoration? decoration,
      TextAlign? textAlign,
      TextOverflow? overflow})
      : super(
          text,
          key: key,
          textAlign: textAlign,
          maxLines: overflow != null ? 1 : null,
          style: style ??
              TextStyle(
                decoration: decoration,
                fontFamily: 'Poppins',
                fontSize: fontSize ?? 2.h,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? Colors.black,
                overflow: overflow,
              ),
        );
}
