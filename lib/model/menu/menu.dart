import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String menuIcon,
    required String title,
    required String route,
  }) = _Menu;
  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
