import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/search_statu.dart';

import '../const/global_variable.dart';
import '../const/style/global_color.dart';
import '../const/style/global_text_styles.dart';
import '../method/get_storage.dart';

/// <h2>CupertinoTextField를 이용한 TextField</h2>
///* [SearchScreen], [DonationSearchScreen], [ProjectScreen](댓글)에서 사용
/// @param textController: 텍스트 컨트롤러
class CommonTextField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final bool isSearchScreen;
  final Rx<SEARCH_STATUS> textStatus;
  final bool hasPrefix;
  final bool alwaysSuffix;
  final Future<void> Function(String) onSubmitted;
  final Future<void> Function(String) onChanged;
  final Future<void> Function()? suffixOnTap;
  final bool isPlain;

  const CommonTextField({
    super.key,
    required this.textController,
    required this.placeHolder,
    this.isSearchScreen = true,
    required this.textStatus,
    this.hasPrefix = true,
    this.alwaysSuffix = false,
    required this.onSubmitted,
    required this.onChanged,
    required this.suffixOnTap,
    this.isPlain = false,
  });

  @override
  Widget build(BuildContext context) {
    return //1. 뒤로가기 아이콘 + 검색 필드
        Row(
      children: [
        isSearchScreen
            ? Container(
                margin: EdgeInsets.only(right: 14.w),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      iconDir + "ic_arrow_left_24.svg",
                      width: 24.w,
                    )),
              )
            : SizedBox.shrink(),
        Expanded(
          child: CupertinoTextField(
            controller: textController,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: isPlain ? AppColors.white : AppColors.searchBackground,
              borderRadius: BorderRadius.circular(8.r),
              border: isPlain
                  ? (textController.text.isNotEmpty &&
                          textController.value.text != null)
                      ? Border.all(color: AppColors.grey8)
                      : Border.all(color: AppColors.grey1)
                  : null,
            ),
            keyboardType: TextInputType.text,
            cursorColor: AppColors.black,
            cursorHeight: 18.h,
            style: AppTextStyles.T1Bold13.copyWith(
              color: AppColors.grey8,
              height: 1.5,
            ),
            placeholder: placeHolder,
            placeholderStyle: AppTextStyles.T1Bold13.copyWith(
                color: AppColors.grey4, height: 1.5),
            prefixMode: OverlayVisibilityMode.notEditing,
            prefix: hasPrefix
                ? Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: SvgPicture.asset(iconDir + "ic_search_16.svg"))
                : null,
            // clearButtonMode: OverlayVisibilityMode.editing,
            suffixMode: !alwaysSuffix
                ? OverlayVisibilityMode.editing
                : OverlayVisibilityMode.always,
            suffix: GestureDetector(
              onTap: () async {
                textController.clear();
                textStatus.value = SEARCH_STATUS.INIT;
                if (suffixOnTap != null) {
                  await suffixOnTap!();
                }
              },
              child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  //TODO 추후 다른 아이콘 추가시 변수 추가
                  child: SvgPicture.asset(iconDir + "ic_search_cancel_22.svg")),
            ),
            //자동 키보드 활성화
            autofocus: isSearchScreen ? true : false,
            onSubmitted: ((value) async {
              textStatus.value = SEARCH_STATUS.SEARCH;
              await onSubmitted(value);
            }),
            onChanged: ((value) async {
              textStatus.value = SEARCH_STATUS.EDIT;
              await onChanged(value);
            }),
          ),
        )
      ],
    );
  }
}

class CommonInputField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final bool autoFocus;
  final bool alwaysSuffix;
  final Future<void> Function(String) onSubmitted;
  final Future<void> Function(String) onChanged;
  final Future<void> Function()? suffixOnTap;

  const CommonInputField(
      {super.key,
      required this.textController,
      required this.placeHolder,
      required this.alwaysSuffix,
      required this.onSubmitted,
      required this.onChanged,
      this.suffixOnTap,
      required this.autoFocus});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textController,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: textController.text.isNotEmpty
              ? Border.all(color: AppColors.grey8)
              : Border.all(color: AppColors.grey1)),
      keyboardType: TextInputType.text,
      cursorColor: AppColors.black,
      cursorHeight: 18.h,
      style: AppTextStyles.T1Bold13.copyWith(
        color: AppColors.grey8,
        height: 1.5,
      ),
      placeholder: placeHolder,
      placeholderStyle:
          AppTextStyles.T1Bold13.copyWith(color: AppColors.grey4, height: 1.5),
      suffixMode: !alwaysSuffix
          ? OverlayVisibilityMode.editing
          : OverlayVisibilityMode.always,
      suffix: GestureDetector(
        onTap: () async {
          textController.clear();
        },
        child: Padding(
            padding: EdgeInsets.only(right: 14.w),
            //TODO 추후 다른 아이콘 추가시 변수 추가
            child: SvgPicture.asset(iconDir + "ic_search_cancel_22.svg")),
      ),
      //자동 키보드 활성화
      autofocus: autoFocus ? true : false,
      onSubmitted: ((value) async {
        await onSubmitted(value);
      }),
      onChanged: ((value) async {
        await onChanged(value);
      }),
    );
  }

  factory CommonInputField.nickName({
    required TextEditingController textController,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "닉네임을 입력해주세요",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: (value) async {},
        autoFocus: true);
  }
}
