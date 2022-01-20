import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/controller/calc/calculator_controller.dart';

class CalculateResult extends StatelessWidget {
  const CalculateResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headText1 = Theme.of(context).textTheme.headline1;
    final headText2 = Theme.of(context).textTheme.headline2;
    return GetX<CalculatorController>(builder: (ctx) {
      return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        //Equation
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          child: Text(
            ctx.equation.value.isNotEmpty ? ctx.equation.value : "0",
            style: ctx.isPressedCompute.value ? headText2 : headText1,
          ),
        ),
        ctx.result.value.isNotEmpty
            ? const SizedBox(height: 10)
            : const SizedBox(
                height: 0,
              ),
        //Result
        ctx.result.value.isNotEmpty
            ? AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "=${ctx.result.value}",
                  style: ctx.isPressedCompute.value ? headText1 : headText2,
                ),
              )
            : const SizedBox(height: 0, width: 0),
        ctx.result.value.isNotEmpty
            ? const SizedBox(height: 10)
            : const SizedBox(
                height: 0,
              ),
      ]);
    });
  }
}
