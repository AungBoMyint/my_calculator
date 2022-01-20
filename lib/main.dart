import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controller/app/app_controller.dart';
import 'model/history_data.dart';
import 'utils/app_theme.dart';
import 'view/page/page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<History>(HistoryAdapter());
  await Hive.openBox("database");
  runApp(const MyApp());
}

//MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Make to be Global
    Get.put(AppController());
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box("database").listenable(keys: ["themes"]),
      builder: (context, box, child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: box.get("themes", defaultValue: true)
                ? lightTheme()
                : darkTheme(),
            initialRoute: '/home',
            getPages: [
              GetPage(name: '/home', page: () => const HomePage()),
              GetPage(name: '/settingPage', page: () => const SettingPage()),
            ]);
      },
    );
  }
}
