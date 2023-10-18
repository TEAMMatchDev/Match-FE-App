import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; //Date Format 사용
import 'package:flutter/cupertino.dart';

import 'package:match/util/const/style/global_color.dart';
import '../const/style/global_text_styles.dart';

import 'package:flutter/cupertino.dart';

class CallBottomSheet extends StatefulWidget {
  @override
  _CallBottomSheetState createState() => _CallBottomSheetState();
}

class _CallBottomSheetState extends State<CallBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // 여기에서 이전에 선택한 값을 초기화하거나 로드합니다.
    selectedDate = DateTime.now(); // 예를 들어 현재 시간으로 초기화
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        selectedDate != null
            ? DateFormat('yyyy.MM.dd').format(selectedDate)
            : '생년월일',
        style: AppTextStyles.T1Bold14,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              height: getHeightByPercentOfScreen(33.0, context),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: _BuildButtonSet(),
                  ),
                  Expanded(
                    flex: 7,
                    child: BirthDatePicker(
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          selectedDate = dateTime;
                        });
                      },
                      initDateStr: DateFormat('yyyy.MM.dd').format(selectedDate),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}



class BirthDatePicker extends StatelessWidget { //DatePicker 위젯
  final void Function(DateTime) onDateTimeChanged;
  final String ?initDateStr;

  BirthDatePicker({
    required this.onDateTimeChanged,
    this.initDateStr,
  });

  @override
  Widget build(BuildContext context) {
    final initDate = DateFormat('yyyy.MM.dd').parse(initDateStr ?? '2000.01.01');
    return SizedBox(
      height: 150.h,
      child: CupertinoDatePicker(
        minimumYear: 1900,
        maximumYear: DateTime.now().year,
        initialDateTime: initDate,
        maximumDate: DateTime.now(),
        onDateTimeChanged: onDateTimeChanged,
        mode: CupertinoDatePickerMode.date,
      ),
    );
  }
}

class _BuildButtonSet extends StatelessWidget {
  const _BuildButtonSet({
    Key? key,
    this.onPressCancel,
    this.onPressDone,
  }) : super(key: key);

  final void Function()? onPressCancel;
  final void Function()? onPressDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: onPressCancel ??
                  () {
                Navigator.pop(context);
              },
        ),
        CupertinoButton(
          child: Text(
            'Done',
          ),
          onPressed: onPressDone ??
                  () {
                Navigator.pop(context);
              },
        ),
      ],
    );
  }
}



double getHeightByPercentOfScreen(double percent,  BuildContext context) {
  return MediaQuery.of(context).size.height * percent / 100;
}