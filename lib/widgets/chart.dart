import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/data/utility.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final int indexx;
  const Chart({super.key, required this.indexx});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddData>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();
        j = false;
        break;
      default:
        a = [];
    }

    if (a == null || a!.isEmpty) {
      return const SizedBox.shrink(); // Return empty widget if no data
    }

    List<int> timeData = time(a!, b ? true : false);
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: timeData.isEmpty
                ? <SalesData>[]
                : List.generate(timeData.length, (index) {
                    return SalesData(
                        j
                            ? b
                                ? a![index].datetime.hour.toString()
                                : a![index].datetime.day.toString()
                            : a![index].datetime.month.toString(),
                        b
                            ? index > 0
                                ? timeData[index] + timeData[index - 1]
                                : timeData[index]
                            : index > 0
                                ? timeData[index] + timeData[index - 1]
                                : timeData[index]);
                  }),
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
