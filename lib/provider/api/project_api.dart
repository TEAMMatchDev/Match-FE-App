import 'package:dio/dio.dart';
import 'package:match/model/enum/project_type.dart';
import 'package:match/model/project_detail/project_detail.dart';
import 'package:match/model/project_history.dart/project_history.dart';
import 'package:match/modules/donate/view/donate_view.dart';
import 'package:match/provider/api/util/dio_services.dart';
import 'package:match/provider/api/util/global_api_field.dart';

import '../../model/api/pagination.dart';
import '../../model/today_project/today_project.dart';
import '../../util/const/style/global_logger.dart';

class ProjectApi {
  ///* 3-5 pagination 추가 호출 판별 함수
  static Pagination project = Pagination(isLast: false, totalCnt: 0);
  static Pagination projectHistory = Pagination(isLast: false, totalCnt: 0);

  ///<h2>3-5 API | 프로젝트 리스트</h2>
  ///* search탭에서 공통으로 사용
  ///* [DonateScreen] , [DonationSearchScreen] 에서 사용
  ///* pagination
  static Future<List<TodayProject>> getProjectList({
    ProjectType? type,
    bool getMore = false,
    String? content,
  }) async {
    if (!getMore) {
      project.currentpage = 0;
    } else {
      project.currentpage += 1;
    }
    var queryParameters = {
      "page": project.currentpage,
      "size": PAGINATION_SIZE,
      "filter": "LATEST",
    };
    if (type != null) {
      queryParameters['projectKind'] = type.name;
    }
    if (content != null) {
      queryParameters['content'] = content;
    }
    try {
      Response response = await DioServices()
          .to()
          .get("/projects/list", queryParameters: queryParameters);

      project.totalCnt = response.data[RESULT][TOTAL];
      project.isLast = response.data[RESULT][LAST];

      logger.d(
          "pagination 정보: totalCnt:${project.totalCnt}, currentPage:${project.currentpage} isLast:${project.isLast}");

      return List.generate(
        response.data[RESULT][CONTENTS].length,
        (index) =>
            TodayProject.fromJson(response.data[RESULT][CONTENTS][index]),
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>3-8 API | 프로젝트 상세조회</h2>
  static Future<ProjectDetail?> getProjectDetail({
    required int projectId,
  }) async {
    try {
      Response response =
          await DioServices().to().get("/projects/detail/${projectId}");

      return ProjectDetail.fromJson(response.data[RESULT]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  ///<h2>3-6 API | 프로젝트 관심 설정 / 관심 삭제</h2>
  ///* @param bool isLike, int projectId
  static Future<bool> setProjectLike({
    required bool isLike,
    required int projectId,
  }) async {
    try {
      Response response =
          await DioServices().to().patch("/projects/$projectId");

      return response.data[RESULT]["like"];
    } catch (e) {
      logger.e(e.toString());
      return isLike;
    }
  }

  ///<h2>3-9 API | 프로젝트 매치 기록 조회</h2>
  ///* pagination
  static Future<List<ProjectHistory>> getProjectHistoryList(
      {required int projectId, bool getMore = false}) async {
    try {
      if (!getMore) {
        projectHistory.currentpage = 0;
      } else {
        projectHistory.currentpage += 1;
      }
      Response response = await DioServices()
          .to()
          .get("/projects/match/${projectId}", queryParameters: {
        "page": projectHistory.currentpage,
        "size": PAGINATION_SIZE
      });
      projectHistory.totalCnt = response.data[RESULT][TOTAL];
      projectHistory.isLast = response.data[RESULT][LAST];

      logger.d(
          "pagination 정보: totalCnt:${projectHistory.totalCnt}, currentPage:${projectHistory.currentpage} isLast:${projectHistory.isLast}");

      return List.generate(
          response.data[RESULT][CONTENTS].length,
          (index) =>
              ProjectHistory.fromJson(response.data[RESULT][CONTENTS][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
