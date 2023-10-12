import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; //Date Format 사용
import 'package:flutter/cupertino.dart';

import 'package:match/util/const/style/global_color.dart';
import '../const/style/global_text_styles.dart';

class CuDatePicker extends StatelessWidget {
  const CuDatePicker({
    Key key,
    this.onDateChange,
  }) : super(key: key);

  final Function(DateTime value) onDateChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400.0,
      ),
      child: CupertinoDatePicker(
        initialDateTime: DateTime.now(),
        maximumDate: new DateTime.now(),
        minimumYear: 1900,
        maximumYear: 2023,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onDateChange ?? (DateTime value) {},
      ),
    );
  }
}