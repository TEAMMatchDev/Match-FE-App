import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:match/modules/project/controller/project_controller.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/components/global_widget.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';
import '../../../model/comment/comment.dart';
import '../../../model/enum/report_type.dart';
import '../../../provider/api/comment_api.dart';
import '../../../util/components/global_modal.dart';
import '../../home/widget/home_widget.dart';

///*댓글, 기록 Widget
class ProjectComment extends StatelessWidget {
  final String profileUrl;
  final String profile;
  final String text;
  final String timeStamp;
  final bool isEdit;
  final bool my;
  final Comment? comment;

  const ProjectComment(
      {super.key,
      required this.profileUrl,
      required this.profile,
      required this.text,
      required this.timeStamp,
      this.isEdit = false,
      this.my = false,
      this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileItem(profileUrl: profileUrl, isBorder: false, size: 40),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      profile,
                      style: AppTextStyles.T1Bold14,
                    ),
                    my
                        ? Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: TypeChip(
                              type: "Me",
                              color: AppColors.primary100,
                              textColor: AppColors.primary500,
                              horizontalPadding: 4,
                              verticalPadding: 3,
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  text,
                  style: AppTextStyles.S1SemiBold12.copyWith(
                      color: AppColors.grey7),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 251.w,
                  child: Text(
                    timeStamp,
                    style: AppTextStyles.L1Medium10.copyWith(
                        color: AppColors.grey4),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          isEdit
              ? GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                        CommentBottomSheet(
                          comment: comment!,
                          isMine: my,
                        ),
                        ignoreSafeArea: false);
                  },
                  child: SvgPicture.asset("${iconDir}ic_more_18.svg"))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

Widget _textListTile(
    {required String text, required Future<void> Function() onTap}) {
  return GestureDetector(
    onTap: () async {
      await onTap();
      Get.back();
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
      child: Text(
        text,
        style: AppTextStyles.T1Bold15,
        textAlign: TextAlign.start,
      ),
    ),
  );
}

///<h2>Comment 관련 로직을 처리하는 BottomSheet 위젯</h2>
class CommentBottomSheet extends StatelessWidget {
  final bool isMine;
  final Comment comment;

  const CommentBottomSheet(
      {super.key, this.isMine = false, required this.comment});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 27.h)
            .copyWith(bottom: 0.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textListTile(
                text: "신고하기",
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CommonDialog.report(
                          text: "신고",
                          context: context,
                          onGrant: () async {
                            Rx<ReportType?> reportType = (null).obs;
                            Get.bottomSheet(
                              isScrollControlled: true,
                              ReportReasonSheet(reportType: reportType),
                            );
                            if (reportType.value != null) {
                              var tmpResult = await CommentApi.reportComment(
                                  comment: comment.comment,
                                  commentId: comment.commentId,
                                  reportReason: reportType.value!.name);
                              if (tmpResult) {
                                Fluttertoast.showToast(
                                    msg: "신고가 성공적으로 접수되었습니다.");
                                ProjectController.to.comments.remove(comment);
                                Get.back();
                              }
                            }
                          },
                        );
                      });
                }),
            _textListTile(
                text: "차단하기",
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CommonDialog.report(
                          text: "차단",
                          context: context,
                          onGrant: () async {
                            //TODO: 차단하기 api 연결
                          },
                        );
                      });
                }),
            isMine
                ? _textListTile(
                    text: "삭제하기",
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommonDialog.delete(
                                context: context,
                                onGrant: () async {
                                  var result = await CommentApi.deleteComment(
                                    commentId: comment.commentId,
                                  );
                                  if(result){
                                    Fluttertoast.showToast(msg: "삭제되었습니다.");
                                    ProjectController.to.comments.remove(comment);
                                    Get.back();
                                  }
                                });
                          });
                    })
                : const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CommonButton.payment(
                  text: "취소",
                  verticalPadding: 13,
                  isActive: true,
                  onTap: () async {
                    Get.back();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ReportReasonSheet extends StatelessWidget {
  final Rx<ReportType?> reportType;

  const ReportReasonSheet({super.key, required this.reportType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 493.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 27.h)
          .copyWith(bottom: 0.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      ),
      child: ListView(children: [
        ...ReportType.values
            .map((report) => _textListTile(
                text: report.stateName,
                onTap: () async {
                  reportType.value = report;
                  Get.back();
                }))
            .toList(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: CommonButton.payment(
              text: "취소",
              verticalPadding: 13,
              isActive: true,
              onTap: () async {
                Get.back();
              }),
        )
      ]),
    );
  }
}
