import 'package:hive_flutter/hive_flutter.dart';

part 'history_data.g.dart';

@HiveType(typeId: 1)
class History extends HiveObject {
  @HiveField(0)
  String expression;
  @HiveField(1)
  String result;
  History({required this.expression, required this.result});
}
