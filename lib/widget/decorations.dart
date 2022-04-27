import 'package:flutter/material.dart';
import 'package:shorten/app_core/app_core.dart';


class SUDecorations extends BoxDecoration {
  SUDecorations.textfield({
    bool? isError,
    double? borderRadius,
  }) : super(
          borderRadius:
              BorderRadius.circular(borderRadius ?? SUSpace.circularSpace),
          color: Colors.white,
          border: Border.all(
              color: isError! ? APPColors.appRed : APPColors.appLightGrey,
              width: 2.0),
          boxShadow: [
            const BoxShadow(
              color: APPColors.appLightGrey,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
        );

  SUDecorations.cicularWithShadow({
    Color? bgColor,
    Color? borderColor,
  }) : super(
          borderRadius: BorderRadius.circular(SUSpace.circularSpace),
          color: bgColor ?? Colors.white,
          border: Border.all(
              color: borderColor ?? APPColors.appLightGrey, width: 2.0),
          boxShadow: [
            const BoxShadow(
              color: APPColors.appLightGrey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            )
          ],
        );

  SUDecorations.cicularWithShadowWithImage(
      {Color? bgColor,
      Color? borderColor,
      required ImageProvider image,
      double? circularSpace,
      bool boxShadowEnable = true,
      bool borderActive = false})
      : super(
          borderRadius:
              BorderRadius.circular(circularSpace ?? SUSpace.circularSpace),
          color: bgColor ?? Colors.white,
          border: borderActive
              ? Border.all(
                  color: borderColor ?? APPColors.appLightGrey, width: 2.0)
              : null,
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
          boxShadow: !boxShadowEnable
              ? null
              : [
                  const BoxShadow(
                    color: APPColors.appLightGrey,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                ],
        );

  SUDecorations.cicularWithShadowNwithoutBorder(
      {Color? color,
      bool boxShadowEnable = true,
      double? circularSpace,
      bool borderActive = false})
      : super(
          borderRadius: BorderRadius.circular(
              circularSpace ?? SUSpace.containerCircularSpace),
          color: color ?? Colors.white,
          border: borderActive
              ? Border.all(color: APPColors.appRed, width: 1.0)
              : null,
          boxShadow: !boxShadowEnable
              ? null
              : [
                  const BoxShadow(
                    color: APPColors.appLightGrey,
                    blurRadius: 5.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                ],
        );

  SUDecorations.top({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                circularSpace ?? SUSpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );

  SUDecorations.bottom({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
                circularSpace ?? SUSpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );

  SUDecorations.left({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
                circularSpace ?? SUSpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );

  SUDecorations.right({Color? color, double? circularSpace})
      : super(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(
                circularSpace ?? SUSpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
        );

  SUDecorations.topWithImage(
      {Color? color, double? circularSpace, required ImageProvider image})
      : super(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                circularSpace ?? SUSpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        );

  SUDecorations.leftWithImage(
      {Color? color, double? circularSpace, required ImageProvider image})
      : super(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(
                circularSpace ?? SUSpace.containerCircularSpace),
          ),
          color: color ?? Colors.white,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        );

  SUDecorations.shadowWithImage()
      : super(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: APPColors.appBorderColor),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: APPColors.appLightGrey,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                3.0,
              ),
            )
          ],

        );
}
