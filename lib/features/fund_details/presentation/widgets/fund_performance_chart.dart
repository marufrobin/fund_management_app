import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/fund_details.dart';

class FundPerformanceChart extends StatelessWidget {
  final List<FundHistoryItem> data;

  const FundPerformanceChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: data.first.date.millisecondsSinceEpoch.toDouble(),
          maxX: data.last.date.millisecondsSinceEpoch.toDouble(),
          minY: data.map((e) => e.value).reduce((a, b) => a < b ? a : b) * 0.99,
          maxY: data.map((e) => e.value).reduce((a, b) => a > b ? a : b) * 1.01,
          lineBarsData: [
            LineChartBarData(
              spots: data
                  .map((e) => FlSpot(
                        e.date.millisecondsSinceEpoch.toDouble(),
                        e.value,
                      ))
                  .toList(),
              isCurved: true,
              color: primaryColor,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor.withOpacity(0.3),
                    primaryColor.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  final textStyle = TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  );
                  return LineTooltipItem(
                    '\$${touchedSpot.y.toStringAsFixed(2)}',
                    textStyle,
                  );
                }).toList();
              },
              tooltipRoundedRadius: 8.r,
              tooltipPadding: EdgeInsets.all(8.r),
              tooltipMargin: 8.r,
              fitInsideHorizontally: true,
              fitInsideVertically: true,
            ),
          ),
        ),
      ),
    );
  }
}
