import 'package:equatable/equatable.dart';

class DashboardData extends Equatable {
  final double currentBalance;
  final double availableBalance;
  final List<Transaction> recentTransactions;

  const DashboardData({
    required this.currentBalance,
    required this.availableBalance,
    required this.recentTransactions,
  });

  @override
  List<Object> get props => [currentBalance, availableBalance, recentTransactions];
}

class Transaction extends Equatable {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final bool isIncome;

  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.isIncome,
  });

  @override
  List<Object> get props => [id, title, amount, date, isIncome];
}
