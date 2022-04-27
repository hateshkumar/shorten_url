import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'decorations.dart';

class ImageLoader extends StatelessWidget {
  final String? imagePath;

  const ImageLoader({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: _getImage());
  }

  Widget _getImage() {
    return Container(
      height: 25.h,
      width: 45.w,
      decoration: SUDecorations.cicularWithShadowWithImage(
          image: AssetImage(imagePath!)),
    );
  }
}

class SvgLoader extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const SvgLoader(
      {Key? key,
      required this.imagePath,
      required this.width,
      required this.height,
      this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: getSVG());
  }

  Widget getSVG() {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: SvgPicture.asset(
        imagePath!,
        fit: boxFit ?? BoxFit.contain,
      ),
    );
  }
}
