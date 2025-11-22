import 'package:equatable/equatable.dart';

import '../../domain/entities/transaction_history.dart';

abstract class TransactionHistoryState extends Equatable {
  const TransactionHistoryState();

  @override
  List<Object?> get props => [];
}

class TransactionHistoryInitial extends TransactionHistoryState {}

class TransactionHistoryLoading extends TransactionHistoryState {}

class TransactionHistoryLoaded extends TransactionHistoryState {
  final TransactionHistory? data;
  final TransactionType? activeFilter;
  final String? searchQuery;
  final int currentPage;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const TransactionHistoryLoaded({
    required this.data,
    this.activeFilter,
    this.searchQuery = '',
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [
        data,
        activeFilter,
        searchQuery,
        currentPage,
        hasReachedMax,
        isLoadingMore,
      ];

  TransactionHistoryLoaded copyWith({
    TransactionHistory? data,
    Object? activeFilter = _undefined,
    String? searchQuery,
    int? currentPage,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return TransactionHistoryLoaded(
      data: data ?? this.data,
      activeFilter: activeFilter == _undefined
          ? this.activeFilter
          : activeFilter as TransactionType?,
      searchQuery: searchQuery ?? this.searchQuery,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

const Object _undefined = Object();

class TransactionHistoryError extends TransactionHistoryState {
  final String? message;

  const TransactionHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}
