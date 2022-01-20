import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late SharedPreferences sharePref;
  late ScrollController scrollController;

  var isLight = true.obs;
  var database = Hive.box("database");

  @override
  void onInit() async {
    tabController = TabController(length: 3, vsync: this)
      ..addListener(() => setPageIndex(tabController.index));
    scrollController = ScrollController(
      initialScrollOffset: 0.0,
    );
    sharePref = await SharedPreferences.getInstance();
    tabController.index = await getPageIndex();
    ever(isLight, setThemeToDatabase);
    super.onInit();
  }

  //Get Page Index
  Future<int> getPageIndex() async {
    return sharePref.getInt("pageIndex") ?? 0;
  }

  //Set Page Index
  void setPageIndex(index) {
    sharePref.setInt("pageIndex", index);
  }

  setThemeToDatabase(bool value) {
    database.put("themes", value);
  }
}
