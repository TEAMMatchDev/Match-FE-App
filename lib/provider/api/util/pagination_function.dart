import 'global_api_field.dart';

///<h2>Pagination 조건</h2>
///1. 현재 index가 마지막 index일때
///2. 현재 index가 0이 아닐때
///3. 현재 list의 총 길이가 PAGINATION_SIZE의 배수일때
Future<void> getMoreData(
    {required int index,
    required int totalCnt,
    required Future<void> Function(int) getMore}) async {
  if (index == (totalCnt - 1) &&
      index != 0 &&
      totalCnt % PAGINATION_SIZE == 0) {
    Future.wait({getMore(index ~/ (PAGINATION_SIZE - 1))});
  }
}
