import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/history_provider.dart';

class HistoryCard extends ConsumerStatefulWidget {
  HistoryCard();

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends ConsumerState<HistoryCard> {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() =>
    //     ref.read(historyProvider.notifier).fetchHistoryData(widget.stockID));
  }

  @override
  Widget build(BuildContext context) {
    final historyData = ref.watch(historyProvider);

    Shadow? a;
    double t = 1.0;
    Shadow? b;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20),
          if (historyData.isEmpty)
            Center(child: CircularProgressIndicator())
          else
            Container(
              height: 300, // Set a fixed height for the chart
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.white,
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        final date =
                            DateTime.fromMillisecondsSinceEpoch(value.toInt());
                        return '${date.month}/${date.day}';
                      },
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  minX: historyData
                      .map((spot) => spot.x)
                      .reduce((a, b) => a < b ? a : b),
                  maxX: historyData
                      .map((spot) => spot.x)
                      .reduce((a, b) => a > b ? a : b),
                  minY: historyData
                      .map((spot) => spot.y)
                      .reduce((a, b) => a < b ? a : b),
                  maxY: historyData
                      .map((spot) => spot.y + 10)
                      .reduce((a, b) => a > b ? a : b),
                  lineBarsData: [
                    LineChartBarData(
                      spots: historyData,
                      isCurved: true,
                      colors: [const Color.fromARGB(255, 9, 138, 243)],
                      barWidth: 3,
                      shadow: Shadow.lerp(a, b, t),
                      belowBarData: BarAreaData(
                        show: true,
                        colors: [
                          Color.fromARGB(255, 4, 112, 87).withOpacity(0.8)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
