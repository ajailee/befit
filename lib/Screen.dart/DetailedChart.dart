import 'package:befit/Model/GraphModel.dart';
import 'package:befit/widget/Chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailedChart extends StatelessWidget {
  static String routeName = '/DetailedScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as Map<String, List<GraphData>>;

    return SafeArea(
      child: Scaffold(
        body: Hero(
            tag: 'we',
            child: MyChartWidget(
              titleText: args.keys.first,
              list: args[args.keys.first]!,
            )),
      ),
    );
  }
}
