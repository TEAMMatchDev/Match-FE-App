import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; //Date Format 사용
import 'package:flutter/cupertino.dart';

import 'package:match/util/const/style/global_color.dart';
import '../const/style/global_text_styles.dart';

import 'package:flutter/cupertino.dart';

class ToggleDatePicker extends StatelessWidget {
  const ToggleDatePicker({
    Key? key,
    this.showPicker,
  }) : super(key: key);

  final void Function(BuildContext context)? showPicker;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        'OPEN DATE PICKER',
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        showPicker?.call(context);
      },
    );
  }
}

class HandlePickerButton extends StatelessWidget {
  const HandlePickerButton({
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