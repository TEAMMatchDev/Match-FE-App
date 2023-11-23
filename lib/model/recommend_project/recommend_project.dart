import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_project.freezed.dart';
part 'recommend_project.g.dart';

@freezed
class RecommendProject with _$RecommendProject {
  const factory RecommendProject({
    required int projectId,
    required String projectKind,
  }) = _RecommendProject;
  factory RecommendProject.fromJson(Map<String, dynamic> json) =>
      _$RecommendProjectFromJson(json);
}
