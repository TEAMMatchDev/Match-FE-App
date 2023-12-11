import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:match/modules/payment/view/payment_select_card_view.dart';
import 'package:match/modules/payment/widget/card_slider_widget.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

class PayMethodRadioButtons extends StatefulWidget {
  final ProjectController _projectController = Get.find<ProjectController>();
  final String state;

  PayMethodRadioButtons({required this.state});

  @override
  _PayMethodRadioButtonsState createState() => _PayMethodRadioButtonsState();
}

class _PayMethodRadioButtonsState extends State<PayMethodRadioButtons> {
  String selectedOption = '카카오페이';

  void handleRadioValueChanged(String value) {
    Future.microtask(() =>
        setState(() {
          selectedOption = value;
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DualRadioButtons(
          state: widget.state,
          option1: '카카오페이',
          option2: '신용 / 체크카드 결제',
          onChanged: handleRadioValueChanged,
          selectedOption: selectedOption,
        ),

      ],
    );
  }
}

class DualRadioButtons extends StatefulWidget {
  final String state;
  final String option1;
  final String option2;
  final ValueChanged<String> onChanged;
  final String selectedOption;

  DualRadioButtons({
    required this.state,
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
        // if (widget.state != 'REGULAR')
        //   InkWell(
        //     onTap: () {
        //       widget.onChanged(widget.option1);
        //     },
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: <Widget>[
        //         Radio<String>(
        //           value: widget.option1,
        //           groupValue: widget.selectedOption,
        //           onChanged: (value) {
        //             widget.onChanged(value!);
        //           },
        //           activeColor: AppColors.grey9,
        //           visualDensity: VisualDensity(horizontal: -4.0),
        //         ),
        //         SvgPicture.asset(
        //           iconDir + "payment/ic_kakaopay.svg",
        //           width: 40.w,
        //         ),
        //         SizedBox(width: 8.w),
        //         Text(widget.option1),
        //       ],
        //     ),
        //   ),
        InkWell(
          onTap: () {
            widget.onChanged(widget.option2);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Material(
                type: MaterialType.transparency,
                child: Radio<String>(
                  value: widget.option2,
                  groupValue: widget.selectedOption,
                  onChanged: (value) {
                    widget.onChanged(value!);
                  },
                  activeColor: AppColors.grey9,
                  visualDensity: VisualDensity(horizontal: -4.0),
                ),
              ),
              Text(widget.option2),
            ],
          ),
        ),
        if (widget.selectedOption == widget.option2)
          CardSlider(),
      ],
    );
  }
}
