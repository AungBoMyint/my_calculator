import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/controller/app/app_controller.dart';

import 'calculate_result.dart';
import 'history_calculated.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();
    return LayoutBuilder(builder: (context, size) {
      return SizedBox(
        height: size.maxHeight * 0.5,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 10),
          controller: appController.scrollController,
          dragStartBehavior: DragStartBehavior.down,
          shrinkWrap: true,
          reverse: true,
          children: const [
            //Original Input
            CalculateResult(),
            //Space
            SizedBox(height: 20),
            //HistoryResult,
            HistoryCalculatedWidget(),
          ],
        ),
      );
    });
  }
}
