import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shorten/app_core/app_core.dart';
import 'package:shorten/widget/decorations.dart';
import 'package:shorten/widget/text_widget.dart';

import 'package:sizer/sizer.dart';

import 'app_spacers.dart';

enum KeyBoardType {
  text,
  email,
  number,
}

// ignore: must_be_immutable
class SUTextField extends StatefulWidget {
  SUTextField(
      {Key? key,
      String? hintText,
      bool? error,
      String? inpuText,
      int? lenth,
      TextEditingController? controller,
      Function(String)? validator,
      Function()? onTap,
      KeyBoardType? keyboardType,
      double? borderRadius,
      Widget? sufixWidget,
      bool isValid = false,
      bool isName = false,
      bool readOnly = false,
      IconData? icon})
      : _hint = hintText,
        _controller = controller,
        _validator = validator,
        _keyboardType = keyboardType,
        error = error,
        _lenth = lenth,
        _inpuText = inpuText,
        _borderRadius = borderRadius,
        _icon = icon,
        _sufixWidget = sufixWidget,
        _isValid = isValid,
        _isName = isName,
        _readOnly = readOnly,
        _onTap = onTap,
        super(key: key);
  final String? _hint;
  final bool? error;
  String? _inpuText;
  int? _lenth;
  final double? _borderRadius;

  // ignore: prefer_final_fields
  TextEditingController? _controller;

  // ignore: unused_field
  final Function(String)? _validator;
  final Function()? _onTap;

  // ignore: prefer_final_fields
  KeyBoardType? _keyboardType = KeyBoardType.text;
  final IconData? _icon;
  final Widget? _sufixWidget;

  // ignore: prefer_final_fields
  bool _isValid;

  // ignore: prefer_final_fields
  bool _isName;
  final bool _readOnly;

  @override
  State<SUTextField> createState() => _SUTextFieldState();
}

class _SUTextFieldState extends State<SUTextField> {
  // bool error = false;
  // bool error1 = false;
  @override
  void initState() {
    super.initState();
    // widget._controller!.addListener(() {
    //   if (widget._validator != null) {
    //     error1 = widget._validator!.call();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (widget._inpuText != null) {
      widget._controller!.text = widget._inpuText.toString();
      widget._controller!.selection = TextSelection.fromPosition(
          TextPosition(offset: widget._controller!.text.length));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70.w,
          height: 8.h,
          decoration: SUDecorations.textfield(

              isError: widget.error!, borderRadius: widget._borderRadius),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  readOnly: widget._readOnly,
                  controller: widget._controller,
                  keyboardType: _getKeyboardType(),
                  inputFormatters: _getInputFormatters(),
                  onChanged: widget._validator,
                  onTap: widget._onTap,
                  decoration: InputDecoration(
                      hintText:widget.error!?APPConstants.shorten_hint_error: widget._hint ?? '',

                      hintStyle:  TextStyle(color:widget.error!? Colors.red: Colors.grey,fontSize: 15.sp),
                      border: InputBorder.none),
                ),
              ),
              widget._sufixWidget != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: widget._sufixWidget,
                    )
                  : Container(),
            ],
          ),
        ),
        SUSpacer(
          height: 0.7.h,
        ),

        SUSpacer(),
      ],
    );
  }

  _getKeyboardType() {
    if (widget._keyboardType == KeyBoardType.text) {
      return TextInputType.text;
    } else if (widget._keyboardType == KeyBoardType.email) {
      return TextInputType.emailAddress;
    } else if (widget._keyboardType == KeyBoardType.number) {
//      return TextInputType.number;
      return TextInputType.numberWithOptions(signed: true, decimal: true);
    }
  }

  _getInputFormatters() {
    if (widget._keyboardType == KeyBoardType.number) {
      return [
        FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
        FilteringTextInputFormatter.deny(RegExp("[abFeG]")),
        LengthLimitingTextInputFormatter(widget._lenth),
      ];
    } else if (widget._isName) {
      return [
        FilteringTextInputFormatter.deny(RegExp("[0-9]")),
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
      ];
    } else {
      return null;
    }
  }
}
