import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KeyDataItem {
  final String? text;
  final IconData? icons;
  final bool mainKey;
  final bool allCleanKey;
  final bool cleanKey;
  final bool logKey;
  final bool changeLogKey;
  final bool deleteKey;
  final bool computeKey;
  final bool canShowFirst;
  final bool needToPrefixZero;
  final bool needToAddBracket;
  KeyDataItem({
    this.icons,
    this.text,
    this.logKey = false,
    this.mainKey = false,
    this.allCleanKey = false,
    this.cleanKey = false,
    this.deleteKey = false,
    this.changeLogKey = false,
    this.computeKey = false,
    this.canShowFirst = true,
    this.needToPrefixZero = false,
    this.needToAddBracket = false,
  });
}

List<KeyDataItem> items = [
  KeyDataItem(
    text: "2nd",
    logKey: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    text: "deg",
    logKey: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    text: "sin",
    logKey: true,
    needToAddBracket: true,
  ),
  KeyDataItem(
    text: "cos",
    logKey: true,
    needToAddBracket: true,
  ),
  KeyDataItem(
    text: "tan",
    logKey: true,
    needToAddBracket: true,
  ),
  KeyDataItem(
    text: "xⁿ",
    logKey: true,
    needToPrefixZero: true,
  ),
  KeyDataItem(
    text: "lg",
    logKey: true,
    needToAddBracket: true,
  ),
  KeyDataItem(
    text: "ln",
    logKey: true,
    needToAddBracket: true,
  ),
  KeyDataItem(
    text: "(",
    logKey: true,
  ),
  KeyDataItem(
    text: ")",
    logKey: true,
  ),
  KeyDataItem(
    logKey: true,
    text: "√x",
  ),
  KeyDataItem(
    text: "AC",
    mainKey: true,
    allCleanKey: true,
  ),
  KeyDataItem(
    icons: FontAwesomeIcons.backspace,
    mainKey: true,
    deleteKey: true,
  ),
  KeyDataItem(
    text: "%",
    mainKey: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    mainKey: true,
    text: "÷",
    needToPrefixZero: true,
  ),
  KeyDataItem(
    logKey: true,
    text: "x!",
    needToPrefixZero: true,
  ),
  KeyDataItem(
    text: "7",
  ),
  KeyDataItem(
    text: "8",
  ),
  KeyDataItem(
    text: "9",
  ),
  KeyDataItem(
    mainKey: true,
    text: "×",
    needToPrefixZero: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    logKey: true,
    text: "⅟x",
    canShowFirst: false,
  ),
  KeyDataItem(
    text: "4",
  ),
  KeyDataItem(
    text: "5",
  ),
  KeyDataItem(
    text: "6",
  ),
  KeyDataItem(
    text: "-",
    mainKey: true,
    needToPrefixZero: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    logKey: true,
    text: "π",
  ),
  KeyDataItem(
    text: "1",
  ),
  KeyDataItem(
    text: "2",
  ),
  KeyDataItem(
    text: "3",
  ),
  KeyDataItem(
    text: "+",
    mainKey: true,
    needToPrefixZero: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    icons: FontAwesomeIcons.arrowsAlt,
    mainKey: true,
    changeLogKey: true,
  ),
  KeyDataItem(
    text: "e",
    logKey: true,
  ),
  KeyDataItem(
    text: "0",
  ),
  KeyDataItem(
    text: ".",
    needToPrefixZero: true,
    canShowFirst: false,
  ),
  KeyDataItem(
    text: "=",
    mainKey: true,
    computeKey: true,
  ),
];
