import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/search_statu.dart';

import '../const/global_variable.dart';
import '../const/style/global_color.dart';
import '../const/style/global_text_styles.dart';

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
  final Widget? suffix;
  final Future<void> Function(String) onSubmitted;
  final Future<void> Function(String) onChanged;

  const CommonTextField(
      {super.key,
      required this.textController,
      required this.placeHolder,
      this.isSearchScreen = true,
      required this.textStatus,
      this.hasPrefix = true,
      this.alwaysSuffix = false,
      this.suffix,
      required this.onSubmitted,
      required this.onChanged});

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
              color: AppColors.searchBackground,
              borderRadius: BorderRadius.circular(8.r),
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
            suffix: suffix,
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
