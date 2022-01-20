import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:my_calculator/controller/calc/calculator_controller.dart';
import 'package:my_calculator/utils/key_data.dart';
import 'package:my_calculator/utils/keyboard_button.dart';

class KeyBoardWidget extends StatelessWidget {
  const KeyBoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorController _controller = Get.find();
    return LayoutBuilder(builder: (context, size) {
      final itemWidth = size.maxWidth;
      return Container(
        decoration: BoxDecoration(
            //color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).dividerColor,
                spreadRadius: 10,
                offset: const Offset(0, 7),
              ),
            ]),
        child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
            child: GetX<CalculatorController>(builder: (ctx) {
              return GridView.count(
                  crossAxisCount: ctx.normalKeyboard.value ? 4 : 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (itemWidth * 0.25) / 75,
                  children: [
                    for (var item in items) ...[
                      if (item.logKey && ctx.normalKeyboard.value) ...[
                        //Null............//
                      ] else ...[
                        KeyboardButton(
                          item: item,
                          child: item.text == null
                              ? Icon(item.icons, color: Colors.amber)
                              : Text(
                                  (item.allCleanKey &&
                                          _controller.equation.isNotEmpty)
                                      ? "C"
                                      : item.text ?? "",
                                  style: item.mainKey
                                      ? Theme.of(context).textTheme.headline3
                                      : Theme.of(context).textTheme.headline4,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                ),
                        )
                      ]
                    ]
                  ]);
            })),
      );
    });
  }
}
