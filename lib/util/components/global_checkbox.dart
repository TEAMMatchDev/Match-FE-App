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
  final List<String> stringList;
  final String title;

  CheckBoxExample({required this.stringList, required this.title});

  @override
  _CheckBoxExampleState createState() => _CheckBoxExampleState(stringList: stringList, title: title);
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  bool selectAllValue = false;
  List<bool> checkBoxValues = [false, false, false, false, false];
  List<String> stringList;
  String title;

  _CheckBoxExampleState({required this.stringList, required this.title}) {
    checkBoxValues = List.filled(stringList.length, false);
  }

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
          stringList: stringList,
          title: title,
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
  final List<String> stringList; // 동의 리스트
  final String title; //동의 항목 제목

  CheckBoxWidget({
    required this.selectAllValue,
    required this.checkBoxValues,
    required this.onSelectAllChanged,
    required this.onSingleCheckBoxChanged,
    required this.stringList, // 동의 리스트
    required this.title, //동의 항목 제목
  });

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SelectAllCheckBox(
          value: widget.selectAllValue,
          onChanged: widget.onSelectAllChanged,
          title: widget.title,
        ),
        SizedBox(height: 21.5.h),
        Divider(
          height: 1,
          color: AppColors.grey1,
          thickness: 1,
        ),
        SizedBox(height: 22.h),

        for (int i = 0; i < widget.checkBoxValues.length; i++)
          SingleCheckBox(
            label: widget.stringList[i], // stringList 속성을 활용
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
  final String title;

  SelectAllCheckBox({
    required this.value,
    required this.onChanged,
    required this.title,
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
            widget.title,
            style: AppTextStyles.T1Bold14,
          ),
        ],
      ),
    );


  }
}


