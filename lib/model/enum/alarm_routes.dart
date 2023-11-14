import '../../provider/routes/routes.dart';

enum AlarmRoutes {
  HOME_SCREEN(Routes.home, null),
  PROJECT_SCREEN(Routes.project, "projectId"),
  MATCH_SCREEN(Routes.burning_match, "projectId"),
  EVENT_SCREEN(Routes.event_detail, "eventId"),
  ALARM_SCREEN(Routes.alarm, null);

  final String routes;
  final String? argumentId;

  const AlarmRoutes(this.routes, this.argumentId);
}

const alarmScreen = {
  "HOME_SCREEN": AlarmRoutes.HOME_SCREEN,
  "PROJECT_SCREEN": AlarmRoutes.PROJECT_SCREEN,
  "MATCH_SCREEN": AlarmRoutes.MATCH_SCREEN,
  "EVENT_SCREEN": AlarmRoutes.EVENT_SCREEN,
};
