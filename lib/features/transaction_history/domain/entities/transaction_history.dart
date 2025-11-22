import 'package:equatable/equatable.dart';

/// Transaction type enum
enum TransactionType { deposit, withdraw, transfer }

/// Transaction status enum
enum TransactionStatus { completed, pending }

/// Main transaction history entity
class TransactionHistory extends Equatable {
  final List<TransactionGroup> groups;

  const TransactionHistory({required this.groups});

  @override
  List<Object> get props => [groups];
}

/// Groups transactions by date
class TransactionGroup extends Equatable {
  final String title;
  final List<TransactionItem> transactions;

  const TransactionGroup({required this.title, required this.transactions});

  @override
  List<Object> get props => [title, transactions];
}

/// Individual transaction item
class TransactionItem extends Equatable {
  final String id;
  final TransactionType type;
  final double amount;
  final String time;
  final TransactionStatus status;
  final DateTime date;

  const TransactionItem({
    required this.id,
    required this.type,
    required this.amount,
    required this.time,
    required this.status,
    required this.date,
  });

  @override
  List<Object> get props => [id, type, amount, time, status, date];
}
