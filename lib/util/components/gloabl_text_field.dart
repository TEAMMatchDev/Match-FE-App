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

  const CommonSearchField({
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
        this.suffixActiveIcon = "search_cancel_22",
        this.suffixUnActiveIcon = "search_cancel_22",
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
  final double? cursorHeight;
  final Future<void> Function(String) onSubmitted;
  final Future<void> Function(String) onChanged;
  final Future<void> Function()? suffixOnTap;
  final int? maxLength;
  final int? maxLines;
  final bool isPassword;

  const CommonInputField({
    super.key,
    required this.textController,
    required this.placeHolder,
    required this.alwaysSuffix,
    required this.onSubmitted,
    required this.onChanged,
    this.inputType = TextInputType.text,
    this.suffixOnTap,
    required this.autoFocus,
    this.cursorHeight,
    this.maxLength,
    this.maxLines,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      maxLines: isPassword ? 1 : maxLines,
      maxLength: maxLength,
      controller: textController,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: textController.text.isNotEmpty
              ? Border.all(color: AppColors.grey8)
              : Border.all(color: AppColors.grey1)),
      keyboardType: inputType,
      textAlignVertical:
          cursorHeight != null ? TextAlignVertical(y: cursorHeight!) : null,
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
          //TODO) textController 가 초기화 될 때 onChange callback
          if (onChanged != null) {
            await onChanged("");
          }
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
      obscureText: isPassword,
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
        autoFocus: true);
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
        isPassword: true,
        autoFocus: true);
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
        inputType: TextInputType.emailAddress,
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
        inputType: TextInputType.emailAddress,
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
        inputType: TextInputType.number,
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
        inputType: TextInputType.visiblePassword,
        isPassword: true,
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
        inputType: TextInputType.visiblePassword,
        isPassword: true,
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
        inputType: TextInputType.name,
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
        onChanged: (value) async {
          if (value.length > 11) {
            Fluttertoast.showToast(msg: "전화번호는 11자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 11);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            // 정상적으로 변경 처리
            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
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
        onChanged: (value) async {
          if (value.length > 6) {
            Fluttertoast.showToast(msg: "인증번호는 6자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 6);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
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
        autoFocus: true);
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
        inputType: TextInputType.phone,
        autoFocus: true);
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
        autoFocus: true);
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
        autoFocus: true);
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
        onChanged: (value) async {
          if (value.length > 16) {
            Fluttertoast.showToast(msg: "카드번호는 16자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 16);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
  }

  // 카드 유효기간의 유효성 검사를 수행하는 함수
  bool isCardExpiryValid(String expiryDate) {
    // 입력값의 길이가 4가 아니면 유효하지 않음
    if (expiryDate.length != 4) {
      return false;
    }
    // 연도와 월 분리
    int year = int.tryParse(expiryDate.substring(2, 4)) ?? 0;
    int month = int.tryParse(expiryDate.substring(0, 2)) ?? 0;
    // 연도와 월이 유효한 범위인지 확인
    if (month < 1 || month > 12) {
      return false;
    }
    // 현재 날짜와 비교
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year % 100; // 현재 연도의 마지막 두 자리
    int currentMonth = currentDate.month;
    // 입력된 유효기간이 현재 날짜보다 이전인지 확인
    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return false;
    }
    return true;
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
        onChanged: (value) async {
          if (value.length > 4) {
            Fluttertoast.showToast(msg: "4자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 4);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            /// 입력 유효성 검사
            int year = int.tryParse(value.substring(2, 4)) ?? 0;
            int month = int.tryParse(value.substring(0, 2)) ?? 0;

            if (month < 1 || month > 12) {
              Fluttertoast.showToast(msg: "유효기간을 바르게 입력해주세요");
            }

            DateTime currentDate = DateTime.now();
            int currentYear = currentDate.year % 100;
            int currentMonth = currentDate.month;

            if (year < currentYear || (year == currentYear && month < currentMonth)) {
              Fluttertoast.showToast(msg: "유효기간을 바르게 입력해주세요");
            }

            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
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
        onChanged: (value) async {
          if (value.length > 3) {
            Fluttertoast.showToast(msg: "3자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 3);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
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
        onChanged: (value) async {
          if (value.length > 10) {
            Fluttertoast.showToast(msg: "6-10자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 10);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
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
        onChanged: (value) async {
          if (value.length > 2) {
            Fluttertoast.showToast(msg: "2자리를 넘을 수 없습니다.");
            textController.text = value.substring(0, 2);
            textController.selection = TextSelection.fromPosition( // 커서를 맨 끝으로 이동
              TextPosition(offset: textController.text.length),
            );
          } else {
            onChange(value);
          }
        },
        inputType: TextInputType.phone,
        autoFocus: true);
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

  factory CommonInputField.survey({
    required TextEditingController textController,
    required Future<void> Function(String) onChange,
  }) {
    return CommonInputField(
      maxLines: 50,
      maxLength: 1000,
      textController: textController,
      placeHolder: "리뷰 내용을 입력해주세요. (선택)",
      alwaysSuffix: false,
      onSubmitted: (value) async {},
      onChanged: onChange,
      inputType: TextInputType.text,
      autoFocus: false,
      cursorHeight: -1.0,
    );
  }
}

Future<void> scrollAnimate(
    BuildContext context, ScrollController scrollController) async {
  logger.e("tap");
  await scrollController.animateTo(MediaQuery.of(context).viewInsets.bottom,
      duration: Duration(milliseconds: 100), curve: Curves.easeIn);
}
