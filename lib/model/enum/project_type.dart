enum ProjectType {
  DOG("강아지"),
  CHILDREN("어린이"),
  YOUTH("청년"),
  WOMEN("여성"),
  ELDER("어르신"),
  DISABLED("장애인"),
  SOCIAL("우리 사회"),
  EARTH("지구촌"),
  NEIGHBOR("이웃"),
  ANIMAL("동물"),
  ENVIRONMENT("환경");

  final String stateName;
  const ProjectType(this.stateName);
}

const _projectTypeMap = {
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
