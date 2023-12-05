import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:match/modules/payment/binding/payment_binding.dart';
import 'package:match/modules/payment/view/payment_method_info_view.dart';
import 'package:match/modules/payment/view/payment_method_web_view.dart';
import 'package:match/modules/payment/widget/select_amount_widget.dart';
import 'package:match/modules/payment/widget/select_paydate_widget.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_number_field.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentDonationScreen extends GetView<PaymentController> {
  PaymentDonationScreen({Key? key}) : super(key: key);

  final ProjectController _projectController = Get.find<ProjectController>();

  @override
  Widget build(BuildContext context){
    final String state = _projectController.projectDetail.value.regularStatus;
    final int projectId = controller.projectId.value;
    final int amount = controller.selectedAmount.value;
    final int date = controller.selectedDate.value;
    final String orderId = controller.orderId.value;
    final String title = _projectController.projectDetail.value.title;

    return  Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h)
                          .copyWith(bottom: 0.h),
                      child: Column(
                        children: [
                          // *1.제목 header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                imgDir + "logo/iv_home_logo.png",
                                width: 75.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Text(
                            '기부금 결제하기',
                            style: AppTextStyles.T1Bold18,
                          ),
                          SizedBox(height: 23.h),
                          SvgPicture.asset(
                            iconDir + "payment/ic_rating_stick_2.svg",
                            width: 330.w,
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            '2. 결제 방식을 선택해주세요.',
                            style: AppTextStyles.T1Bold15.copyWith(color: AppColors.grey9),
                          ),
                          SizedBox(height: 20.h),
                          Divider(
                            height: 1,
                            color: AppColors.grey1,
                            thickness: 1,
                          ),
                          SizedBox(height: 20.h),
                          state == 'REGULAR'
                              ? Text(
                            '기부처',
                            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                          )
                              : Text(
                            '기부 프로젝트',
                            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            width: 360.w,
                            decoration: BoxDecoration(
                              color: AppColors.grey11,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              '${_projectController.projectDetail.value.title}',
                              style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey7),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            '기부 금액',
                            style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                          ),
                          SizedBox(height: 16.h),
                          SelectAmountRadioButtons(),
                          SizedBox(height: 30.h),
                          state != "REGULAR"
                              ? SizedBox.shrink()
                              : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '기부 결제일',
                                style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9),
                              ),
                              SizedBox(height: 16.h),
                              PayDateRadioButtons(),
                            ],
                          ),
                          SizedBox(height: 56.h),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 6.w, bottom: 20.h, top: 10.h),
                  child: CommonButton.back(
                    text: "이전 돌아가기",
                    onTap: () async {
                      Get.back();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 6.w, right: 20.w, bottom: 20.h, top: 10.h),
                    child:
                    Obx(() =>
                    controller.isPayAbleReg.value
                        ? CommonButton.login(
                            text: "확인",
                            onTap: () async {
                              print(">>> 현재 결제방식 state: ${state}");

                              if (state == 'REGULAR') {
                                /// 정기결제
                                Get.to(PaymentMethodWebView(
                                  appTitle: "기부금 정기 결제하기",
                                  state: state,
                                  webUrl: "/auth/pay",
                                  projectId: projectId,
                                  amount: amount,
                                  date: date,
                                  inApp: true,
                                ));
                              } else if (state == 'ONE_TIME'){
                                /// 단기결제
                                Get.to(PaymentMethodWebView(
                                  appTitle: "기부금 단기 결제하기",
                                  state: state,
                                  webUrl: "/auth/pay",
                                  projectId: projectId,
                                  amount: amount,
                                  date: 0,
                                  orderId: orderId,
                                  title: title,
                                  inApp: true,
                                ));
                              }
                            },
                          )
                        : CommonButton.loginDis(
                            text: "확인",
                            onTap: () async {},
                          ),
                    )
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
