import 'package:equatable/equatable.dart';
import '../../domain/entities/transaction_history.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();

  @override
  List<Object?> get props => [];
}

class TransactionHistoryLoadRequested extends TransactionHistoryEvent {}

class TransactionHistoryLoadMore extends TransactionHistoryEvent {}

class TransactionHistoryFilterChanged extends TransactionHistoryEvent {
  final TransactionType? filter;

  const TransactionHistoryFilterChanged(this.filter);

  @override
  List<Object?> get props => [filter];
}

class TransactionHistorySearchChanged extends TransactionHistoryEvent {
  final String query;

  const TransactionHistorySearchChanged(this.query);

  @override
  List<Object> get props => [query];
}
