import 'dart:async';

import 'package:get_storage/get_storage.dart';

enum StorageKey {
  SEARCH;
}

///*GetStorage를 이용한 로컬 저장소
///[SearchScreen]에서 최근검색어 기능에 사용
class GetStorageUtil {
  ///* singleton 내부 저장소
  static final storage = GetStorage();

  ///GetStorage에서 key에 해당하는 value를 가져옴
  ///* [key] : [StorageKey] enum
  static FutureOr<String> getValue(StorageKey key) async =>
      await storage.read(key.name) ?? "";

  ///GetStorage에서 key에 해당하는 value를 설정해줌
  ///* [key] : [StorageKey] enum, [value] : 저장할 값
  static Future<void> setValue(StorageKey key, String value) async =>
      await storage.write(key.name, value);

  ///GetStorage에서 key에 해당하는 value를 제거
  ///* [key] : [StorageKey] enum
  static Future<void> delValue(StorageKey key) async =>
      await storage.remove(key.name);
}
