import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_detail.freezed.dart';
part 'project_detail.g.dart';

@freezed
class ProjectDetail with _$ProjectDetail {
  const factory ProjectDetail({
    required int projectId,
    required List<ProjectImage> projectImgList,
    required String title,
    required String usages,
    required bool donationAble,
    required String kind,
    required String regularStatus,
  }) = _ProjectDetail;
  factory ProjectDetail.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailFromJson(json);
}

@freezed
class ProjectImage with _$ProjectImage {
  const factory ProjectImage({
    required int imgId,
    required String imgUrl,
    required int sequence,
  }) = _ProjectImage;
  factory ProjectImage.fromJson(Map<String, dynamic> json) =>
      _$ProjectImageFromJson(json);
}
