import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_calculator/model/history_data.dart';

class HistoryCalculatedWidget extends StatelessWidget {
  const HistoryCalculatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("database").listenable(keys: ["historyList"]),
        builder: (context, Box<dynamic> box, child) {
          final historyList = box.get("historyList", defaultValue: []);
          if (historyList.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: historyList.map<Widget>((e) {
                final item = e as History;
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "${item.expression} = ${item.result}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                );
              }).toList(),
            );
          }
          return const SizedBox(height: 0, width: 0);
        });
  }
}
