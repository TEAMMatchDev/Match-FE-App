///* Pagination 처리에 사용되는 변수 data class
class Pagination {
  bool isLast;
  int totalCnt;
  int currentpage;

  Pagination(
      {required this.isLast, required this.totalCnt, this.currentpage = 0});
}
