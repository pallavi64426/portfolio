// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Research extends StatelessWidget {
  const Research({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.science,
                size: 48,
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              Text(
                'Research',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.blue.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.article,
                              size: 24,
                              color: Color(0xFF6366F1),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Artificial Intelligence in Medical Diagnosis of Post-Treatment Diseases',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Conference: ICRAECCT- Apr \'25 (CSJMU, India & Aurel Vlaicu University, Romania)',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Research focusing on improving predictive healthcare through AI algorithms for more accurate post-treatment disease diagnosis.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Model Performance Metrics',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 200,
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: 100,
                              barTouchData: BarTouchData(enabled: false),
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      const titles = ['Accuracy', 'Precision', 'Recall', 'F1-Score'];
                                      return SideTitleWidget(
                                        axisSide: meta.axisSide,
                                        child: Text(
                                          titles[value.toInt()],
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      );
                                    },
                                    reservedSize: 30,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      return SideTitleWidget(
                                        axisSide: meta.axisSide,
                                        child: Text(
                                          '${value.toInt()}%',
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      );
                                    },
                                    reservedSize: 30,
                                  ),
                                ),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              barGroups: [
                                BarChartGroupData(
                                  x: 0,
                                  barRods: [BarChartRodData(toY: 93, color: Theme.of(context).colorScheme.primary)],
                                ),
                                BarChartGroupData(
                                  x: 1,
                                  barRods: [BarChartRodData(toY: 89, color: Theme.of(context).colorScheme.primary)],
                                ),
                                BarChartGroupData(
                                  x: 2,
                                  barRods: [BarChartRodData(toY: 91, color: Theme.of(context).colorScheme.primary)],
                                ),
                                BarChartGroupData(
                                  x: 3,
                                  barRods: [BarChartRodData(toY: 90, color: Theme.of(context).colorScheme.primary)],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
