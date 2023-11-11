import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match/util/components/global_app_bar.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../util/const/style/global_color.dart';

class ServiceCenterScreen extends StatelessWidget {
  const ServiceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.basic("고객센터"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 20.h),
              child: const Divider(
                height: 1,
                color: AppColors.divider1,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  launchUrlString(
                          mode: LaunchMode.externalApplication,
                          "http://pf.kakao.com/_NfdhG")
                      .catchError((err) {
                    launchUrlString(
                        mode: LaunchMode.externalApplication,
                        'http://pf.kakao.com/_NfdhG');
                    return true;
                  });
                }
                //IOS
                else if (Platform.isIOS) {
                  launchUrlString("http://pf.kakao.com/_NfdhG")
                      .catchError((err) {
                    launchUrlString('http://pf.kakao.com/_NfdhG');
                    return true;
                  });
                }
              },
              child: Text(
                "고객센터 링크",
                style: AppTextStyles.L1Medium14.copyWith(
                  color: AppColors.grey7,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 54.h,
            ),
            const Text("(주)매치컴퍼니 사업자 정보\n\n사업자 등록번호"),
          ],
        ),
      ),
    );
  }
}
