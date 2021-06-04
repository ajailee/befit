import 'package:befit/Model/GraphModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyChartWidget extends StatelessWidget {
  final String titleText;
  final List<GraphData> list;

  const MyChartWidget({Key? key,required this.titleText,required this.list}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return list.length>0?  SfCartesianChart(
        primaryXAxis: CategoryAxis(),
    // Chart title
    title: ChartTitle(text: titleText),
    // Enable legend
    legend: Legend(isVisible: true),
    // Enable tooltip
    //tooltipBehavior: _tooltipBehavior,
    series: <LineSeries<GraphData, String>>[
    LineSeries<GraphData, String>(
    dataSource: list,
    xValueMapper: (GraphData sales, _) => sales.year,
    yValueMapper: (GraphData sales, _) => sales.value,
    // Enable data label
    dataLabelSettings: DataLabelSettings(isVisible: true))
    ]):Center(child: Text('NO DATA FOUND CALCULATE MBI AND SAVE TO SEE IN CHART😀',style: TextStyle(fontSize: 30),));
  }
}
