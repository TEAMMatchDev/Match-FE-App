import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../controller/donate_controller.dart';

class DonateScreen extends GetView<DonateController> {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "후원",
                  style: AppTextStyles.T1Bold16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
