import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class CheckBoxItem {
  final int index;
  final bool value;

  CheckBoxItem(this.index, this.value);
}

class CheckBoxExample extends StatefulWidget {
  @override
  _CheckBoxExampleState createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  bool selectAllValue = false;
  List<bool> checkBoxValues = [false, false, false, false, false];

  void onSelectAllChanged(bool? value) {
    setState(() {
      selectAllValue = value ?? false;
      checkBoxValues = List.filled(checkBoxValues.length, selectAllValue);
    });
  }

  void onSingleCheckBoxChanged(CheckBoxItem item) {
    setState(() {
      checkBoxValues[item.index] = item.value;
      selectAllValue = checkBoxValues.every((value) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckBoxWidget(
          selectAllValue: selectAllValue,
          checkBoxValues: checkBoxValues,
          onSelectAllChanged: onSelectAllChanged,
          onSingleCheckBoxChanged: onSingleCheckBoxChanged,
        ),
        // TODO - 선택된 항목 확인하는 버튼 ElevatedButton
        // ElevatedButton(
        //   onPressed: () {
        //     List<int> selectedItems = [];
        //     for (int i = 0; i < checkBoxValues.length; i++) {
        //       if (checkBoxValues[i]) {
        //         selectedItems.add(i);
        //       }
        //     }
        //     print('선택된 항목: $selectedItems');
        //   },
        //   child: Text('선택된 항목 확인'),
        // ),
      ],
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final bool selectAllValue;
  final List<bool> checkBoxValues;
  final ValueChanged<bool?> onSelectAllChanged;
  final ValueChanged<CheckBoxItem> onSingleCheckBoxChanged;

  CheckBoxWidget({
    required this.selectAllValue,
    required this.checkBoxValues,
    required this.onSelectAllChanged,
    required this.onSingleCheckBoxChanged,
  });

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  List<String> stringList = [
    '[필수] MATCH 이용약관 동의',
    '[필수] 개인정보 수집 및 이용 동의',
    '[필수] 만 14세 이상',
    '[선택] 마케팅 목적의 개인정보 수집 및 이용 동의',
    '[선택] 기부 진행사항 등 광고성 앱 푸시 알림 수신 동의',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SelectAllCheckBox(
          value: widget.selectAllValue,
          onChanged: widget.onSelectAllChanged,
        ),
        SizedBox(height: 21.5.h),
        Divider( // 수평선 추가
          height: 1, // 선의 높이
          color: AppColors.grey1, // 선의 색상
          thickness: 1, // 선의 두께
        ),
        SizedBox(height: 22.h),

        for (int i = 0; i < widget.checkBoxValues.length; i++)
          SingleCheckBox(
            label: stringList[i],
            value: widget.checkBoxValues[i],
            onChanged: (value) {
              widget.onSingleCheckBoxChanged(CheckBoxItem(i, value!));
            },
          ),
      ],
    );
  }
}

class SingleCheckBox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  SingleCheckBox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  _SingleCheckBoxState createState() => _SingleCheckBoxState();
}

class _SingleCheckBoxState extends State<SingleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 라벨 클릭 시 체크박스 토글
        widget.onChanged(!widget.value);
      },
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0), // 원하는 상하 간격
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.h,
                child: widget.value
                    ? SvgPicture.asset(iconDir + "login/ic_check2_able_24.svg")
                    : SvgPicture.asset(iconDir + "login/ic_check2_disable_24.svg"),
              ),
              SizedBox(width: 6.w),
              Text(
                widget.label,
                style: AppTextStyles.T1Bold13,
              ),
            ],
          ),
        ),
      ),


    );
  }
}


class SelectAllCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  SelectAllCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  _SelectAllCheckBoxState createState() => _SelectAllCheckBoxState();
}

class _SelectAllCheckBoxState extends State<SelectAllCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 라벨 클릭 시 체크박스 토글
        widget.onChanged(!widget.value);
      },
      child: Row(
        // 왼쪽 정렬
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            child: widget.value
                ? SvgPicture.asset(iconDir + "login/ic_check1_able_20.svg")
                : SvgPicture.asset(iconDir + "login/ic_check1_disable_20.svg"),
          ),
          SizedBox(width: 6.w),
          Text(
            '모두 동의',
            style: AppTextStyles.T1Bold14,
          ),
        ],
      ),
    );


  }
}


