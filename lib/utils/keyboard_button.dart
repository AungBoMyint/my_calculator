import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:my_calculator/controller/calc/calculator_controller.dart';

import 'key_data.dart';

class KeyboardButton extends StatelessWidget {
  final KeyDataItem item;
  final Widget child;
  const KeyboardButton({
    Key? key,
    required this.item,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorController _controller = Get.find();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(20.0, 20),
        primary: Theme.of(context).cardColor,
      ),
      onPressed: () {
        if (item.allCleanKey) {
          if (_controller.equation.value.isEmpty) {
            _controller.allClean();
          } else {
            _controller.clean();
          }
        } else if (item.changeLogKey) {
          _controller.changeKeyboard();
        } else if (item.computeKey) {
          _controller.isPressedComputeMethod(true);
        } else if (item.deleteKey) {
          _controller.deleteEquation();
        } else {
          _controller.addUserInputIntoEquation(
            input: item.text ?? "",
            canShowFirst: item.canShowFirst,
            needToAddBracket: item.needToAddBracket,
            needToPrefixZero: item.needToPrefixZero,
          );
        }
      },
      child: child,
    );
  }
}
