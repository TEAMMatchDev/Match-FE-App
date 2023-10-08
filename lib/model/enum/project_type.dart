enum ProjectType {
  DOG("강아지", "dog"),
  CHILDREN("어린이", "children"),
  YOUTH("청년", "youth"),
  WOMEN("여성", "women"),
  ELDER("어르신", "elder"),
  DISABLED("장애인", "disabled"),
  SOCIAL("우리 사회", "social"),
  EARTH("지구촌", "earth"),
  NEIGHBOR("이웃", "neighbor"),
  ANIMAL("동물", "animal"),
  ENVIRONMENT("환경", "environment");

  final String stateName;
  final String engName;
  const ProjectType(this.stateName, this.engName);
}

Map<String, ProjectType> projectTypeMap = {
  'DOG': ProjectType.DOG,
  'CHILDREN': ProjectType.CHILDREN,
  'YOUTH': ProjectType.YOUTH,
  'WOMEN': ProjectType.WOMEN,
  'DISABLED': ProjectType.DISABLED,
  'SOCIAL': ProjectType.SOCIAL,
  'EARTH': ProjectType.EARTH,
  'NEIGHBOR': ProjectType.NEIGHBOR,
  'ANIMAL': ProjectType.ANIMAL,
  'ENVIRONMENT': ProjectType.ENVIRONMENT,
};
