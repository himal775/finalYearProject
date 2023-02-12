import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class pieChart extends StatelessWidget {
  pieChart(
      {super.key,
      required this.postive,
      required this.negative,
      required this.neutral});
  int postive;
  int negative;
  int neutral;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Opinion Analysis"), centerTitle: true),
      body: Center(
        child: PieChart(
          dataMap: {
            "Postive": postive.toDouble(),
            "Negative": negative.toDouble(),
            "neutral": neutral.toDouble()
          },
          colorList: const [
            Color.fromARGB(255, 110, 203, 10),
            Color.fromARGB(255, 240, 11, 22),
            Color.fromARGB(255, 16, 30, 235),
          ],
          centerText: "Opinion Analysis",
          chartRadius: MediaQuery.of(context).size.width / 2,
          chartValuesOptions: const ChartValuesOptions(
              showChartValues: true, showChartValuesOutside: true),
        ),
      ),
    );
  }
}
