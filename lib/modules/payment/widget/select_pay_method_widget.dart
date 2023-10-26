import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/view/payment_select_card_view.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class PayMethodRadioButtons extends StatefulWidget {
  @override
  _PayMethodRadioButtonsState createState() => _PayMethodRadioButtonsState();
}

class _PayMethodRadioButtonsState extends State<PayMethodRadioButtons> {
  String selectedOption = '카카오페이';

  void handleRadioValueChanged(String value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DualRadioButtons(
          option1: '카카오페이',
          option2: '신용 / 체크카드 결제',
          onChanged: handleRadioValueChanged,
          selectedOption: selectedOption,
        ),
        //Text('Selected Option: $selectedOption'),
      ],
    );
  }
}

class DualRadioButtons extends StatefulWidget {
  final String option1;
  final String option2;
  final ValueChanged<String> onChanged;
  final String selectedOption;

  DualRadioButtons({
    required this.option1,
    required this.option2,
    required this.onChanged,
    required this.selectedOption,
  });

  @override
  _DualRadioButtonsState createState() => _DualRadioButtonsState();
}

class _DualRadioButtonsState extends State<DualRadioButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            widget.onChanged(widget.option1);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio<String>(
                value: widget.option1,
                groupValue: widget.selectedOption,
                onChanged: (value) {
                  widget.onChanged(value!);
                },
                activeColor: AppColors.grey9,
                visualDensity: VisualDensity(horizontal: -4.0),
              ),
              SvgPicture.asset(
                iconDir + "payment/ic_rating_stick_1.svg",
                width: 40.w,
              ),
              SizedBox(width: 8.w),
              Text(widget.option1),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.onChanged(widget.option2);
          },
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Material( // Material 위젯으로 래핑
              type: MaterialType.transparency,
              child: Radio<String>(
                value: widget.option2,
                groupValue: widget.selectedOption,
                onChanged: (value) {
                  widget.onChanged(value!);
                },
                activeColor: AppColors.grey9, // 라디오버튼의 색상 설정
                visualDensity: VisualDensity(horizontal: -4.0),
              ),
            ),
              Text(widget.option2),
            ],
          ),
        ),
        if (widget.selectedOption == widget.option2)
          Column(
            children: [
              SizedBox(height: 23.h),
              GestureDetector(
                  onTap: () {
                    Get.to(PaymentSelectCardScreen());
                  },
                  child:SvgPicture.asset(
                    iconDir + "payment/ic_card_reg.svg",
                    width: 263.w,
                  ),
              ),

              SizedBox(height: 20.h),
              Text(
                  '최초 1회 계좌 등록시 3초 만에 간편결제 가능',
                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey6)
              ),
              SizedBox(height: 20.h),
              Container(
                width: 360.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: AppColors.grey11,
                    width: 1.0,
                  ),
                  color: AppColors.grey11,
                ),
                padding: EdgeInsets.only(left: 10.w, top: 11.w, bottom: 11.w),
                child: Text(
                  '* 첫 후원금은 즉시 결제되며,\n  다음 달부터 선택한 결제일에 결제됩니다.\n* 출금일에 후원금이 승인되지 않으면, 재요청할 수 있습니다.',
                  style: AppTextStyles.T1Bold12.copyWith(color: AppColors.grey4),
                ),
              ),
            ],
          ), /// 옵션2 선택시
      ],
    );
  }
}
