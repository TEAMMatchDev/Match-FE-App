enum ProjectType {
  CHILDREN("어린이", "children"),
  YOUTH("청년", "youth"),
  WOMEN("여성", "women"),
  ELDER("어르신", "elder"),
  DISABLED("장애인", "disabled"),
  SOCIAL("우리 사회", "social"),
  EARTH("지구촌", "earth"),
  NEIGHBOR("어려운 이웃", "neighbor"),
  ANIMAL("동물", "animal"),
  ENVIRONMENT("환경", "environment");

  final String stateName;
  final String engName;

  const ProjectType(this.stateName, this.engName);
}

Map<String, ProjectType> projectTypeMap = {
  'CHILDREN': ProjectType.CHILDREN,
  'YOUTH': ProjectType.YOUTH,
  'WOMEN': ProjectType.WOMEN,
  'ELDER': ProjectType.ELDER,
  'DISABLED': ProjectType.DISABLED,
  'SOCIAL': ProjectType.SOCIAL,
  'EARTH': ProjectType.EARTH,
  'NEIGHBOR': ProjectType.NEIGHBOR,
  'ANIMAL': ProjectType.ANIMAL,
  'ENVIRONMENT': ProjectType.ENVIRONMENT,
};

Map<ProjectType, String> projectTypDescription = {
  ProjectType.EARTH: '바다를 다시 깨끗하게 만들 수 있어요!',
  ProjectType.ANIMAL: "유기동물들의 아픈 상처들을 치유할 수 있어요.",
  ProjectType.CHILDREN: '아이들의 꿈을 꿀 수 있도록 응원해줄 수 있어요.',
};
