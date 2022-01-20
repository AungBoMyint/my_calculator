import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator/model/history_data.dart';

class CalculatorController extends GetxController {
  var equation = "".obs;
  var result = "".obs;
  var normalKeyboard = true.obs;
  var isPressedCompute = false.obs;
  var isAllCleanKey = true.obs;
  var needToAddCloseBracket = false.obs;
  RegExp regExp = RegExp(r'(\D+)');

  final database = Hive.box("database");
  History? history;

  @override
  void onInit() {
    ever(equation, evaluateResult);
    super.onInit();
  }

  //All Clean Database history,equation and result
  void allClean() {
    database.put("historyList", []);
    equation.value = "";
    result.value = "";
  }

  //Clean only equation and result
  void clean() {
    equation.value = "";
    result.value = "";
    history = null;
  }

  //Call this method if user input is "=" and everyTime user enter new input
  void isPressedComputeMethod(bool value) {
    if (equation.value.isNotEmpty && result.value.isNotEmpty) {
      history = History(expression: equation.value, result: result.value);
    }
    isPressedCompute.value = value;
  }

  //When user enter input,we want to change 'AC'key to 'C' key.
  void isAllCleanMethod(bool value) => isAllCleanKey.value = value;

  //Switch Normal Keyboard and Log Keyboard
  void changeKeyboard() => normalKeyboard.value = !normalKeyboard.value;

  //addUserInputIntoEquation
  void addUserInputIntoEquation({
    required String input,
    required bool canShowFirst,
    required bool needToPrefixZero,
    required bool needToAddBracket,
  }) {
    isPressedCompute.value = false;
    if (history != null) {
      final originalList =
          database.get("historyList", defaultValue: []) as List;
      originalList.add(history);
      database.put("historyList", originalList);
      history = null;

      //Then refresh all
      clean();
    }
    //Need to replace all
    input = input
        .replaceAll("xⁿ", "^")
        .replaceAll("√x", "√")
        //.replaceAll("%", "÷100")
        .replaceAll("x!", "!")
        .replaceAll("⅟x", "^(-1)");

    if (equation.value.isEmpty) {
      if (canShowFirst) {
        if (needToAddBracket) {
          addBracket(input);
        } else if (needToPrefixZero) {
          equation.value = "0" + input;
        } else {
          equation.value = input;
        }
      } else {
        if (needToPrefixZero) {
          equation.value = "0" + input;
        } else {
          //Nothing do
        }
      }
    } else {
      if (checkEquationAndInputForNotDigit(
          equation: equation.value, input: input)) {
        if (checkOperatorIsNotEqual(equation.value, input)) {
          if (needToAddBracket) {
            //need to replace
            equation.value =
                getEquationWithoutOperator(equation.value) + input + "(";
          } else {
            equation.value = getEquationWithoutOperator(equation.value) + input;
          }
        }
      } else {
        equation.value = equation.value + input;
      }
    }
  }

  //Evaluate Result
  void evaluateResult(String equation) {
    //Check the last input is +,-,etc...If it is,we don't compute for input or delete.
    if (equation.isNotEmpty && !checkLastStringIsNotDigit(equation)) {
      equation = equation.replaceAll("×", "*").replaceAll("÷", "/");
      try {
        Parser p = Parser();
        Expression? exp;
        try {
          exp = p.parse(equation);
        } on Exception catch (e) {
          result.value = "Error";
        }
        if (exp != null) {
          ContextModel cmd = ContextModel();
          double numberResult = exp.evaluate(EvaluationType.REAL, cmd);
          final completeResult = "$numberResult";
          if (completeResult.endsWith(".0")) {
            result.value =
                completeResult.substring(0, completeResult.length - 2);
          } else {
            result.value = completeResult;
          }
        }
      } on Exception catch (e) {
        result.value = "Error";
      }
    } else if (equation.isNotEmpty) {
      result.value = result.value;
    } else {
      result.value = "";
    }
  }

  bool checkLastStringIsNotDigit(String input) {
    return regExp.hasMatch(getLastString(input));
  }

  String getLastString(String input) {
    return input.substring(input.length - 1);
  }

  String getEquationWithoutOperator(String equation) {
    return equation.substring(0, equation.length - 1);
  }

  //Check Not Digit for Equation and Input
  bool checkEquationAndInputForNotDigit(
      {required String equation, required String input}) {
    return checkLastStringIsNotDigit(equation) &&
        checkLastStringIsNotDigit(input);
  }

  //Check equation's last operator and input operator is not equal
  bool checkOperatorIsNotEqual(String equation, String input) {
    return getLastString(equation) != getLastString(input);
  }

  void addBracket(String input) {
    equation.value = equation.value + input + "(";
  }

  //Delete
  void deleteEquation() {
    try {
      equation.value = equation.value.substring(0, equation.value.length - 1);
    } on RangeError catch (e) {
      equation.value = equation.value;
    }
  }
}
