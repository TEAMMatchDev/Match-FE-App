///* Pagination 처리에 사용되는 변수 data class
class Pagination {
  bool isLast;
  int totalPage;
  int currentpage;

  Pagination(
      {required this.isLast, required this.totalPage, this.currentpage = 0});
}
