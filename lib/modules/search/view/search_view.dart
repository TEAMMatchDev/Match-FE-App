import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
        body: Center(
      child: Text("SearchScreen"),
    ));
  }
}
