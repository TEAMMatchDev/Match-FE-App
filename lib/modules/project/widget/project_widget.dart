import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:match/util/components/global_button.dart';
import 'package:match/util/const/global_variable.dart';
import 'package:match/util/const/style/global_color.dart';
import 'package:match/util/const/style/global_text_styles.dart';

import '../../../model/comment/comment.dart';
import '../../../provider/api/comment_api.dart';
import '../../../util/components/global_modal.dart';
import '../../home/widget/home_widget.dart';

//*댓글, 기록 Widget
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
                Text(
                  profile,
                  style: AppTextStyles.T1Bold14,
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
                    Get.bottomSheet(CommentBottomSheet(
                      comment: comment!,
                      isMine: my,
                    ));
                  },
                  child: SvgPicture.asset("${iconDir}ic_more_18.svg"))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
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
                  CommonDialog.report(
                    text: "신고",
                    context: context,
                    onGrant: () async {
                      // await CommentApi.reportComment(comment: comment.comment,
                      //     commentId: comment.commentId,
                      //     reportReason: reportReason)
                    },
                  );
                }),
            _textListTile(
                text: "차단하기",
                onTap: () async {
                  CommonDialog.report(
                    text: "차단",
                    context: context,
                    onGrant: () async {
                      //TODO: 차단하기 api 연결
                    },
                  );
                }),
            isMine
                ? _textListTile(
                    text: "삭제하기",
                    onTap: () async {
                      CommonDialog.delete(
                          context: context,
                          onGrant: () async {
                            await CommentApi.deleteComment(
                              commentId: comment.commentId,
                            );
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

  Widget _textListTile(
      {required String text, required Future<void> Function() onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
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
}
