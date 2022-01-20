import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/controller/calc/calculator_controller.dart';

import 'keyboard/key_board_widget.dart';
import 'top_widget/top_widget.dart';

class CalculateWidget extends StatelessWidget {
  const CalculateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorController _controller = Get.put(CalculatorController());
    return LayoutBuilder(builder: (context, size) {
      return SizedBox(
          height: size.maxHeight,
          width: size.maxWidth,
          child: GetX<CalculatorController>(builder: (context) {
            return Column(children: [
              //TopWidget
              AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _controller.normalKeyboard.value
                    ? size.maxHeight * 0.4
                    : size.maxHeight * 0.3,
                child: const TopWidget(),
              ),
              //KeyBoardWidget
              AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _controller.normalKeyboard.value
                    ? size.maxHeight * 0.6
                    : size.maxHeight * 0.7,
                child: const KeyBoardWidget(),
              )
            ]);
          }));
    });
  }
}
