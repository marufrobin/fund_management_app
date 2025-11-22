import 'package:equatable/equatable.dart';

class FundDetails extends Equatable {
  final double totalInvestment;
  final double currentValue;
  final double profit;
  final double profitPercentage;
  final List<FundHistoryItem> chartData;

  const FundDetails({
    required this.totalInvestment,
    required this.currentValue,
    required this.profit,
    required this.profitPercentage,
    required this.chartData,
  });

  @override
  List<Object?> get props => [
        totalInvestment,
        currentValue,
        profit,
        profitPercentage,
        chartData,
      ];
}

class FundHistoryItem extends Equatable {
  final DateTime date;
  final double value;

  const FundHistoryItem({required this.date, required this.value});

  @override
  List<Object?> get props => [date, value];
}
