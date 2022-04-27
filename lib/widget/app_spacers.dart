import 'package:flutter/material.dart';
import 'package:shorten/app_core/app_constants/app_spacing.dart';

class SUSpacer extends SizedBox {
  SUSpacer({
    Key? key,
    double? height,
  }) : super(key: key, height: height ?? SUSpace.spacerHeight);
  SUSpacer.width({
    Key? key,
    double? width,
  }) : super(key: key, width: width ?? SUSpace.spacerWidth);
}
