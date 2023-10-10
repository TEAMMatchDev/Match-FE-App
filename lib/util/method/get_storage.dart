import 'dart:async';

import 'package:get_storage/get_storage.dart';

import '../../model/recent_search/recent_search.dart';

enum StorageKey {
  NAME_SEARCH,
  PROJECT_SEARCH;
}

const MAX_ITEMS = 10;

///*GetStorage를 이용한 로컬 저장소
///[SearchScreen]에서 최근검색어 기능에 사용
class GetStorageUtil {
  ///* singleton 내부 저장소
  static final storage = GetStorage();

  //GetStorage에서 key에 해당하는 value를 가져옴
  ///* return : [List<RecentSearch>]
  static Future<List<RecentSearch>> getRecentSearches(StorageKey key) async {
    final List<dynamic>? jsonList = storage.read<List<dynamic>>(key.name);
    if (jsonList == null) {
      return [];
    }
    final List<RecentSearch> recentSearches =
        jsonList.map((json) => RecentSearch.fromJson(json)).toList();
    return recentSearches;
  }

  ///GetStorage에서 key에 해당하는 value를 설정해줌
  ///* [recentSearch] : [RecentSearch]
  static Future<void> addRecentSearch(
      StorageKey key, RecentSearch recentSearch) async {
    List<RecentSearch> recentSearches = await getRecentSearches(key);

    // 리스트 길이를 관리하여 최대 maxItems만큼 유지
    if (recentSearches.length >= MAX_ITEMS) {
      recentSearches.removeAt(0); // 가장 오래된 항목 제거
    }

    // 새 항목 추가
    recentSearches.add(recentSearch);

    // 저장
    storage.write(key.name, recentSearches.map((e) => e.toJson()).toList());
  }

  ///GetStorage에서 key에 해당하는 value를 제거
  ///* [key] : [StorageKey] enum
  static Future<void> delAllSearch(StorageKey key) async =>
      await storage.remove(key.name);
}
