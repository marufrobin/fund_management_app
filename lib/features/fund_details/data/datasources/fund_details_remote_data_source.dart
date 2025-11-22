import 'dart:math';

import '../models/fund_details_model.dart';

abstract class FundDetailsRemoteDataSource {
  Future<FundDetailsModel> getFundDetails(String timePeriod);
}

class FundDetailsRemoteDataSourceImpl implements FundDetailsRemoteDataSource {
  @override
  Future<FundDetailsModel> getFundDetails(String timePeriod) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock data generation based on timePeriod
    final random = Random();
    final now = DateTime.now();
    int days = 30;

    switch (timePeriod) {
      case '1M':
        days = 30;
        break;
      case '3M':
        days = 90;
        break;
      case '6M':
        days = 180;
        break;
      case '1Y':
        days = 365;
        break;
      case 'All':
        days = 730;
        break;
    }

    final chartData = List.generate(days, (index) {
      return FundHistoryItemModel(
        date: now.subtract(Duration(days: days - index)),
        value: 100000 + (index * 100) + (random.nextDouble() * 5000 - 2500),
      );
    });

    final currentValue = chartData.last.value;
    final totalInvestment = 100000.0;
    final profit = currentValue - totalInvestment;
    final profitPercentage = (profit / totalInvestment) * 100;

    return FundDetailsModel(
      totalInvestment: totalInvestment,
      currentValue: currentValue,
      profit: profit,
      profitPercentage: profitPercentage,
      chartData: chartData,
    );
  }
}
