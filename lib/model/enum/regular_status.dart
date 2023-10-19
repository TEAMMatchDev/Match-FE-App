enum RegularStatus {
  REGULAR("정기 후원"),
  ONE_TIME("일회성 후원");

  final String stateName;
  const RegularStatus(this.stateName);
}

Map<String, RegularStatus> regularStatusMap = {
  'REGULAR': RegularStatus.REGULAR,
  'ONE_TIME': RegularStatus.ONE_TIME,
};
