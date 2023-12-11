import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class CommonNumberField extends StatefulWidget {
  final TextEditingController textController;
  final String placeHolder;
  final bool autoFocus;
  final bool alwaysSuffix;
  final TextInputType inputType;
  final double? cursorHeight;
  final Future<void> Function(String) onSubmitted;
  final Future<void> Function(String) onChanged;
  final Future<void> Function()? suffixOnTap;
  final int? maxLength;
  final int? maxLines;
  final bool isPassword;

  const CommonNumberField({
    Key? key,
    required this.textController,
    required this.placeHolder,
    required this.autoFocus,
    required this.alwaysSuffix,
    required this.inputType,
    required this.onSubmitted,
    required this.onChanged,
    this.suffixOnTap,
    this.cursorHeight,
    this.maxLength,
    this.maxLines,
    this.isPassword = false,
  }) : super(key: key);

  factory CommonNumberField.payDate({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonNumberField(
      textController: textController,
      placeHolder: "직접 입력",
      alwaysSuffix: false,
      onSubmitted: (value) async {},
      onChanged: (value) async {
        if (value.length > 2) {
          Fluttertoast.showToast(msg: "2자리를 넘을 수 없습니다.");
          textController.text = value.substring(0, 2);
          textController.selection = TextSelection.fromPosition(
            TextPosition(offset: textController.text.length),
          );
        } else {
          onChange(value);
        }
      },
      inputType: TextInputType.text,
      autoFocus: true,
      isPassword: false,
    );
  }

  @override
  _CommonNumberFieldState createState() => _CommonNumberFieldState();
}

class _CommonNumberFieldState extends State<CommonNumberField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      focusNode: _focusNode,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      controller: widget.textController,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: _focusNode.hasFocus ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: _focusNode.hasFocus ? AppColors.white : (widget.textController
              .text.isNotEmpty ? AppColors.grey8 : AppColors.grey1),
        ),
      ),
      keyboardType: widget.inputType,
      textAlignVertical: widget.cursorHeight != null ? TextAlignVertical(
          y: widget.cursorHeight!) : null,
      cursorColor: AppColors.black,
      cursorHeight: 18.h,
      style: AppTextStyles.T1Bold13.copyWith(
        color: _focusNode.hasFocus ? AppColors.white : AppColors.grey8,
        height: 1.5,
      ),
      placeholder: widget.placeHolder,
      placeholderStyle: AppTextStyles.T1Bold13.copyWith(
          color: AppColors.grey4, height: 1.5),
      suffixMode: !widget.alwaysSuffix
          ? OverlayVisibilityMode.editing
          : OverlayVisibilityMode.always,
      suffix: GestureDetector(
        onTap: () async {
          widget.textController.clear();
          if (widget.onChanged != null) {
            await widget.onChanged("");
          }
        },
        child: Padding(
          padding: EdgeInsets.only(right: 14.w),
          child: SvgPicture.asset(
              "assets/icons/ic_search_cancel_22.svg"), // Update with your icon path
        ),
      ),
      autofocus: widget.autoFocus,
      onSubmitted: (value) async {
        await widget.onSubmitted(value);
      },
      onChanged: (value) async {
        await widget.onChanged(value);
      },
      obscureText: widget.isPassword,
    );
  }
}