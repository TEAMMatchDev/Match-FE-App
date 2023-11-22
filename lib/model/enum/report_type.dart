enum ReportType {
  PROMOTION("영리, 홍보목적"),
  ILLEGAL("불법정보"),
  LEWDNESS("음란, 청소년 유해"),
  TERM_ABUSE("욕설 비방, 차별, 혐오"),
  PRSNL_INFRM("개인 정보 노출, 거래"),
  PAPERING("도배, 스팸"),
  OTHER("기타");

  final String stateName;
  const ReportType(this.stateName);
}

