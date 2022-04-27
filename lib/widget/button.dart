import 'package:flutter/material.dart';
import 'package:shorten/app_core/app_core.dart';
import 'package:shorten/widget/app_spacers.dart';
import 'package:sizer/sizer.dart';

import 'text_widget.dart';

class SUElevatedButton extends ElevatedButton {
  SUElevatedButton({
    Key? key,
    required Function() onPressed,
    String? buttonText,
    double? buttonRadius,
    double? buttonHeight,
    double buttonWidth = 0,
    Color? buttonColor,
    Color? textColor,
    bool disabled = false,
  }) : super(
            key: key,
            onPressed:  onPressed,
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(buttonWidth, buttonHeight ?? 6.h)),
                backgroundColor: disabled
                    ? MaterialStateProperty.all<Color>(disabled?APPColors.appPrimaryViolet:APPColors.appTextGrey)
                    : MaterialStateProperty.all<Color>(
                         disabled? APPColors.appPrimaryViolet: APPColors.appPrimaryCyan)),
            child: SUText.text(
              text: buttonText ?? "Text",
              color: textColor ?? APPColors.appWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ));

  SUElevatedButton.icon({
    Key? key,
    required Function() onPressed,
    String? buttonText,
    double? buttonHeight,
    double buttonWidth = 0,
    Color? buttonColor,
    Color? textColor,
    bool disabled = false,
    required Widget icon,
  }) : super(
            key: key,
            onPressed: disabled ? () {} : onPressed,
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(buttonWidth, buttonHeight ?? 6.h)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SUSpace.circularSpace))),
                backgroundColor: disabled
                    ? MaterialStateProperty.all<Color>(APPColors.appTextGrey)
                    : MaterialStateProperty.all<Color>(
                        buttonColor ?? APPColors.appPrimaryCyan)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SUSpacer.width(),
                Image.asset('assets/icons/ic_line.png'),
                SUSpacer.width(),
                SUText.text(
                  text: buttonText ?? "Text",
                  color: textColor ?? APPColors.appWhite,
                  fontWeight: FontWeight.bold,
                )
              ],
            ));
}

class SUOutlinedButton extends OutlinedButton {
  SUOutlinedButton({
    Key? key,
    required Function() onPressed,
    String? buttonText,
    double? buttonHeight,
    double? buttonWidth,
    Color? borderColor,
    Color? textColor,
    bool disabled = false,
  }) : super(
            key: key,
            onPressed: disabled ? () {} : onPressed,
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                  Size(buttonWidth ?? 6.w, buttonHeight ?? 5.h)),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: borderColor ?? APPColors.appPrimaryCyan),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SUSpace.circularSpace))),
            ),
            child: SUText.text(
              text: buttonText ?? "Text",
              color: textColor ?? APPColors.appPrimaryCyan,
              fontWeight: FontWeight.bold,
            ));
}

class SUTextButton extends TextButton {
  SUTextButton({
    Key? key,
    required Function() onPressed,
    required Widget child,
    String? buttonText,
    double? buttonHeight,
    double? buttonWidth,
    Color? borderColor,
    Color? textColor,
    bool disabled = false,
  }) : super(
            key: key,
            onPressed: disabled ? () {} : onPressed,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.blue.withOpacity(0.04);
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return Colors.blue.withOpacity(0.12);
                  }
                  return null; // Defer to the widget's default.
                },
              ),
            ),
            child: child);
}
