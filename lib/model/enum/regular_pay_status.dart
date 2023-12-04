enum RegularPayStatus {
  PROCEEDING("진행중"),
  PROJECT_FINISH("프로젝트 종료로 인한 정기후원 종료"),
  USER_CANCEL("유저 후원 취소");

  final String stateName;
  const RegularPayStatus(this.stateName);
}

Map<String, RegularPayStatus> regularPayStatusMap = {
  'PROCEEDING': RegularPayStatus.PROCEEDING,
  'PROJECT_FINISH': RegularPayStatus.PROJECT_FINISH,
  'USER_CANCEL': RegularPayStatus.USER_CANCEL,
};
