enum ProjectStatus {
  //진행중
  BEFORE_START("BEFORE_START", "기부 시작 전"),
  //시작 전
  PROCEEDING("PROCEEDING", "기부 진행 중"),
  //마감
  DEADLINE("DEADLINE", "기부 마감");

  final String stateName;
  final String fieldName;
  const ProjectStatus(this.stateName, this.fieldName);
}

const _projectStatusMap = {
  "BEFORE_START": ProjectStatus.BEFORE_START,
  "PROCEEDING": ProjectStatus.PROCEEDING,
  "DEADLINE": ProjectStatus.DEADLINE,
};
