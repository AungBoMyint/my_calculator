
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_calculator/controller/app/app_controller.dart';
import 'package:my_calculator/view/widget/calculate/calc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Make to be Global
    AppController appController = Get.find();
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: TabBar(
            controller: appController.tabController,
            tabs: const [
              Text(
                "Calculator",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Conveter",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Other",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: [
            ValueListenableBuilder<Box>(
              valueListenable:
                  Hive.box("database").listenable(keys: ['themes']),
              builder: (context, box, child) {
                return Switch(
                  value: box.get("themes", defaultValue: false),
                  onChanged: (value) => box.put("themes", value),
                );
              },
            ),
          ]),
      body: TabBarView(
        controller: appController.tabController,
        children: const [
          CalculateWidget(),
          Center(
            child: Text("Conveter"),
          ),
          Center(
            child: Text("Other"),
          ),
        ],
      ),
    );
  }
}
