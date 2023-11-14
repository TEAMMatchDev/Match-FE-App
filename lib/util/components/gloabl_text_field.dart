import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/model/enum/search_status.dart';

import '../const/global_variable.dart';
import '../const/style/global_color.dart';
import '../const/style/global_logger.dart';
import '../const/style/global_text_styles.dart';
import '../method/get_storage.dart';

/// <h2>CupertinoTextField를 이용한 TextField</h2>
///* [SearchScreen], [DonationSearchScreen], [ProjectScreen] (댓글)에서 사용
/// @param textController: 텍스트 컨트롤러
class CommonSearchField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final bool isSearchScreen;
  final Rx<SEARCH_STATUS> textStatus;
  final bool hasPrefix;
  final bool alwaysSuffix;
  final Future<void> Function(String) onSubmitted;
  final Future<void> Function(String) onChanged;
  final Future<void> Function(String)? suffixOnTap;
  final bool isPlain;
  final String suffixActiveIcon;
  final String suffixUnActiveIcon;

  const CommonSearchField(
      {super.key,
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
      this.suffixActiveIcon = "search_cancel_22",
      this.suffixUnActiveIcon = "search_cancel_22"});

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
                if (suffixOnTap != null) {
                  await suffixOnTap!(textController.text);
                } else {
                  textController.clear();
                  textStatus.value = SEARCH_STATUS.INIT;
                }
              },
              child: Obx(
                () => Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: textStatus.value == SEARCH_STATUS.INIT
                        ? SvgPicture.asset(
                            "${iconDir}ic_$suffixUnActiveIcon.svg")
                        : SvgPicture.asset(
                            "${iconDir}ic_$suffixActiveIcon.svg")),
              ),
            ),
            //자동 키보드 활성화
            autofocus: isSearchScreen ? true : false,
            onSubmitted: ((value) async {
              textStatus.value = SEARCH_STATUS.SEARCH;
              await onSubmitted(value);
            }),
            onChanged: ((value) async {
              logger.e(value);
              if (value.isEmpty) {
                textStatus.value = SEARCH_STATUS.INIT;
              } else {
                textStatus.value = SEARCH_STATUS.EDIT;
              }
              await onChanged(value);
            }),
          ),
        )
      ],
    );
  }

  factory CommonSearchField.comment({
    required TextEditingController textController,
    required Rx<SEARCH_STATUS> textStatus,
    required Future<void> Function(String) onSubmit,
  }) {
    return CommonSearchField(
      isSearchScreen: false,
      textController: textController,
      placeHolder: "댓글을 남겨 응원해주세요.",
      alwaysSuffix: true,
      hasPrefix: false,
      suffixActiveIcon: "comment_send_active_30",
      suffixUnActiveIcon: "comment_send_30",
      onSubmitted: onSubmit,
      onChanged: (value) async {},
      textStatus: textStatus,
      suffixOnTap: onSubmit,
    );
  }
}

class CommonInputField extends StatelessWidget {
  final TextEditingController textController;
  final String placeHolder;
  final bool autoFocus;
  final bool alwaysSuffix;
  final TextInputType inputType;
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
      this.inputType = TextInputType.text,
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
      keyboardType: inputType,
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

  //TODO) signIn 로그인
  /// id 입력
  factory CommonInputField.signInID(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "이메일을 입력해주세요.",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.emailAddress,
        autoFocus: false);
  }

  /// pw 입력
  factory CommonInputField.signInPW(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "비밀번호를 입력해주세요.",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.visiblePassword,
        autoFocus: false);
  }

  /// 비밀번호 찾기
  factory CommonInputField.findPW(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "이메일을 입력해주세요.",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  //TODO) signUp 회원가입
  /// id 입력
  factory CommonInputField.signUpId(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "이메일을 입력해주세요.",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  /// id confirm num 입력
  factory CommonInputField.signUpIdConfirm(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "인증번호를 입력해주세요.",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  /// pw 입력
  factory CommonInputField.signUpPw(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "비밀번호를 입력해주세요. 영문, 숫자, 특수문자 조합 6-20자",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  /// pw confirm 입력
  factory CommonInputField.signUpPwConfirm(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "비밀번호를 입력해주세요. ",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  /// 이름 입력
  factory CommonInputField.userName(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "이름을 입력해주세요.",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  /// 전화번호
  factory CommonInputField.userPhone({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "-없이 번호만 입력해주세요",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  /// 전화번호 인증
  factory CommonInputField.userPhoneConfirm({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "인증번호를 입력해주세요",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  /// 비밀번호 찾기 - 이메일
  factory CommonInputField.findPwAuthEmail({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "이메일을 입력해주세요",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: false);
  }

  /// 비밀번호 찾기 - 인증번호
  factory CommonInputField.findPwAuthNum({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "인증번호를 입력해주세요",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: false);
  }

  /// 비밀번호 찾기 - 새로운 비밀번호
  factory CommonInputField.newPw({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "비밀번호 (영문, 숫자 조합 6~20자)",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: false);
  }

  /// 비밀번호 찾기 - 새로운 비밀번호 확인
  factory CommonInputField.newPwConfirm({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "비밀번호 확인",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: false);
  }

  //TODO) 카드정보 입력
  /// 카드번호
  factory CommonInputField.cardNum({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "NNNN - NNNN - NNNN - NNNN",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  /// 유효기간
  factory CommonInputField.cardExp({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "MM / YY",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  /// cvc
  factory CommonInputField.cardCvc({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "NNN",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  /// 생년월일
  factory CommonInputField.cardUserBirth({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "NNNNNN",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  /// 카드 비밀번호
  factory CommonInputField.cardPw({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "NN **",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }

  factory CommonInputField.nickName(
      {required TextEditingController textController,
      required Future<void> Function(String) onChange}) {
    return CommonInputField(
        textController: textController,
        placeHolder: "닉네임을 입력해주세요",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        autoFocus: true);
  }

  factory CommonInputField.phone({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
        textController: textController,
        placeHolder: "변경할 휴대폰 번호를 입력",
        alwaysSuffix: false,
        onSubmitted: (value) async {},
        onChanged: onChange,
        inputType: TextInputType.phone,
        autoFocus: false);
  }
}
