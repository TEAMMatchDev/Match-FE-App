import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:match/model/enum/regular_status.dart';
import 'package:match/modules/payment/view/payment_donation_info_view.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/provider/routes/routes.dart';
import 'package:match/provider/service/auth_service.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentDoneScreen extends GetView<PaymentController> {
  //const PaymentDoneScreen({super.key});
  PaymentDoneScreen({Key? key}) : super(key: key);

  final ProjectController _projectController = Get.find<ProjectController>();

  String get formattedAmount {
    final formatter = NumberFormat('#,###', 'ko_KR');
    return formatter.format(controller.selectedAmount.value);
  }

  String getRegularStatusName() { //정기후원 or 일회성후원
    RegularStatus? status = regularStatusMap[_projectController.projectDetail.value.regularStatus];
    return status?.stateName ?? 'Unknown Status';
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: AppColors.grey11,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h)
                .copyWith(bottom: 0.h),
            child: Column(
              children: [
                //*1.제목 header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      imgDir + "logo/iv_home_logo.png",
                      width: 75.w,
                    ),
                  ],
                ),
              ]
            ),
          ),
          SizedBox(height: 48.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 15.h,
                    child: SvgPicture.asset(
                      iconDir + "payment/ic_pay_done_background_only.svg",
                      width: 320.w,
                      height: 424.h,
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    child: SvgPicture.asset(
                      iconDir + "login/ic_check1_able_20.svg",
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 60.h),
                      Container(
                        width: 163.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '기부금 결제 완료!',
                            style: AppTextStyles.T1Bold24,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: 228.w,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${AuthService.to.donatorProfile.value.name}님, 후원해주셔서 감사합니다.\n세부 내역은 홈에서 확인할 수 있습니다.',
                            style: AppTextStyles.T1Bold15.copyWith(color: AppColors.grey7),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child:
                        Divider(
                          height: 1,
                          color: AppColors.divider1,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(height: 35.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '후원제목',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                                ),
                                SizedBox(width: 27.w),
                                Text(
                                  '${_projectController.projectDetail.value.title}',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Text(
                                  '후원처명',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                                ),
                                SizedBox(width: 27.w),
                                Text(
                                  '${_projectController.projectDetail.value.usages}',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Text(
                                  '후원금액',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                                ),
                                SizedBox(width: 27.w),
                                Text(
                                  '${formattedAmount} 원',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Text(
                                  '후원방식',
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                                ),
                                SizedBox(width: 27.w),
                                Text(
                                  getRegularStatusName(),
                                  style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8),
                                ),
                              ],
                            ),
                            SizedBox(height: 57.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CommonButton.login(
              text: "확인",
              onTap: () async {
                Get.offAllNamed(Routes.main);
              },
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
