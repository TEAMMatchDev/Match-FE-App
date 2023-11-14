import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:match/modules/payment/view/payment_done_view.dart';
import 'package:match/modules/payment/widget/select_pay_method_widget.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/provider/api/order_api.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_checkbox.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../util/const/style/global_color.dart';
import '../controller/payment_controller.dart';
import '../widget/payment_widget.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentMethodScreen> with WidgetsBindingObserver {

  final PaymentController controller = Get.find();
  final ProjectController _projectController = Get.find<ProjectController>();

  List<String> payAgreeStringList = [
      '[필수] 결제대행 서비스 이용약관 동의',
      '[필수] 개인 정보 제 3자 정보 제공 동의',
    ];

  String title = '결제 내용에 모두 동의합니다.';
  bool isAuthAble = false; //필수 항목을 모두 동의 했는지

  String get formattedAmount {
    final formatter = NumberFormat('#,###', 'ko_KR');
    return formatter.format(controller.selectedAmount.value);
  }

  @override
  Widget build(BuildContext context){
    final String state = _projectController.projectDetail.value.regularStatus;

    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  iconDir + "payment/ic_rating_stick_3.svg",
                  width: 330.w,
                ),
                SizedBox(height: 30.h),
                Text(
                    '3. 결제 수단을 선택해주세요.',
                    style: AppTextStyles.T1Bold15.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 20.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 20.h),
                Text(
                    '기부 금액',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 10.h),
                state == 'REGULAR'
                ? Text(
                    '매월 • ${controller.selectedDate.value}일 • ${formattedAmount}원',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8)
                )
                : Text(
                    '${formattedAmount}원',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey8)
                ),
                SizedBox(height: 30.h),
                Text(
                    '기부 수단',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                ),
                //SizedBox(height: 16.h),

                PayMethodRadioButtons(state: state),


                SizedBox(height: 23.h),
                Divider( // 수평선 추가
                  height: 1, // 선의 높이
                  color: AppColors.grey1, // 선의 색상
                  thickness: 1, // 선의 두께
                ),
                SizedBox(height: 30.h),
                Text(
                    '결제 내용 확인 및 동의',
                    style: AppTextStyles.T1Bold14.copyWith(color: AppColors.grey9)
                ),
                SizedBox(height: 16.h),

                CheckBoxExample(
                  stringList: payAgreeStringList,
                  title: title,
                  onAgreementSelected: (value) {
                    //print(">>> 선택한 체크박스: $value");
                    controller.selectedItems.value = value;
                    int mandatoryCount = value.where((item) => item.contains('[필수]')).length; // 선택한 항목 중에서 [필수] 문자열을 포함하는 항목의 개수를 확인
                    setState(() {
                      isAuthAble = mandatoryCount >= 2;
                    });
                  },
                ),


                SizedBox(height: 60.h),


              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 6),
                  child: CommonButton.back(
                    text: "이전 돌아가기",
                    onTap: () async {
                      Get.back();
                    },
                  ),
                ),
              ),
              Expanded(
                child:
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: isAuthAble
                        ? CommonButton.login(
                      text: "확인",
                      onTap: () async {
                        if(state == 'REGULAR') {
                          var result = await OrderApi.setRegularPay(
                              cardId: controller.cardId.value,
                              projectId: _projectController.projectId,
                              amount: controller.selectedDate.value,
                              payDate: controller.selectedAmount.value);
                          if (result){
                            Get.to(PaymentDoneScreen());
                          }
                        }
                        else{
                          Get.back(); ///단기결제(2차)
                        }
                      },
                    )
                        : CommonButton.loginDis(
                      text: "확인",
                      onTap: () async {},
                    ),
                  ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
        ],
        ),
      ),
    );
  }
}
