import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../domain/entities/transaction_history.dart';
import '../../domain/usecases/get_transaction_history.dart';
import 'transaction_history_event.dart';
import 'transaction_history_state.dart';

const _searchDebounce = Duration(milliseconds: 300);
const _loadMoreThrottle = Duration(milliseconds: 1000);

EventTransformer<E> _debounce<E>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

EventTransformer<E> _throttle<E>(Duration duration) {
  return (events, mapper) => events.throttle(duration).switchMap(mapper);
}

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {
  final GetTransactionHistory getTransactionHistory;

  TransactionHistoryBloc({
    required this.getTransactionHistory,
  }) : super(TransactionHistoryInitial()) {
    on<TransactionHistoryLoadRequested>(_onLoadRequested);
    on<TransactionHistoryLoadMore>(
      _onLoadMore,
      transformer: _throttle(_loadMoreThrottle),
    );
    on<TransactionHistoryFilterChanged>(_onFilterChanged);
    on<TransactionHistorySearchChanged>(
      _onSearchChanged,
      transformer: _debounce(_searchDebounce),
    );
  }

  Future<void> _onLoadRequested(
    TransactionHistoryLoadRequested event,
    Emitter<TransactionHistoryState> emit,
  ) async {
    emit(TransactionHistoryLoading());

    final result = await getTransactionHistory(page: 1);

    result.fold(
      (failure) =>
          emit(const TransactionHistoryError('Failed to load transactions')),
      (data) => emit(TransactionHistoryLoaded(
        data: data,
        currentPage: 1,
        hasReachedMax: data.groups.isEmpty,
      )),
    );
  }

  Future<void> _onLoadMore(
    TransactionHistoryLoadMore event,
    Emitter<TransactionHistoryState> emit,
  ) async {
    if (state is! TransactionHistoryLoaded) return;

    final currentState = state as TransactionHistoryLoaded;

    // Don't load if already loading or reached max
    if (currentState.isLoadingMore || currentState.hasReachedMax) return;

    // Set loading more flag
    emit(currentState.copyWith(isLoadingMore: true));

    final nextPage = currentState.currentPage + 1;
    final result = await getTransactionHistory(page: nextPage);

    result.fold(
      (failure) {
        // Revert loading state on error
        emit(currentState.copyWith(isLoadingMore: false));
      },
      (newData) {
        // Merge new groups with existing ones
        final mergedGroups = _mergeGroups(
          currentState.data?.groups ?? [],
          newData.groups,
        );

        emit(currentState.copyWith(
          data: TransactionHistory(groups: mergedGroups),
          currentPage: nextPage,
          hasReachedMax: newData.groups.isEmpty,
          isLoadingMore: false,
        ));
      },
    );
  }

  void _onFilterChanged(
    TransactionHistoryFilterChanged event,
    Emitter<TransactionHistoryState> emit,
  ) {
    if (state is TransactionHistoryLoaded) {
      final currentState = state as TransactionHistoryLoaded;
      emit(currentState.copyWith(activeFilter: event.filter));
    }
  }

  void _onSearchChanged(
    TransactionHistorySearchChanged event,
    Emitter<TransactionHistoryState> emit,
  ) {
    if (state is TransactionHistoryLoaded) {
      final currentState = state as TransactionHistoryLoaded;
      emit(currentState.copyWith(searchQuery: event.query));
    }
  }

  /// Merge new groups with existing groups by title
  List<TransactionGroup> _mergeGroups(
    List<TransactionGroup> existing,
    List<TransactionGroup> newGroups,
  ) {
    final Map<String, List<TransactionItem>> groupMap = {};

    // Add existing transactions
    for (final group in existing) {
      groupMap[group.title] = [...group.transactions];
    }

    // Merge new transactions
    for (final group in newGroups) {
      if (groupMap.containsKey(group.title)) {
        groupMap[group.title]!.addAll(group.transactions);
      } else {
        groupMap[group.title] = [...group.transactions];
      }
    }

    // Convert back to list of groups
    return groupMap.entries
        .map((entry) => TransactionGroup(
              title: entry.key,
              transactions: entry.value,
            ))
        .toList();
  }
}
