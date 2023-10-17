import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; //Date Format 사용
import 'package:flutter/cupertino.dart';

import 'package:match/util/const/style/global_color.dart';
import '../const/style/global_text_styles.dart';

import 'package:flutter/cupertino.dart';

class CallBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        '생년월일',
        style: AppTextStyles.T1Bold14,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              height: 150.h,
              child: BirthDatePicker(
                onDateTimeChanged: (dateTime) {
                  // Process selected date
                  // Example: setState(() { selectedDate = dateTime; });
                },
              ),
            );
          },
        );
      },
    );
  }
}

class BirthDatePicker extends StatelessWidget {
  final void Function(DateTime) onDateTimeChanged;
  final String ?initDateStr;

  BirthDatePicker({
    required this.onDateTimeChanged,
    this.initDateStr,
  });

  @override
  Widget build(BuildContext context) {
    final initDate =
    DateFormat('yyyy-MM-dd').parse(initDateStr ?? '2000-01-01');
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


double getHeightByPercentOfScreen(double percent,  BuildContext context) {
  return MediaQuery.of(context).size.height * percent / 100;
}