import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/injection_container.dart';
import '../../domain/entities/transaction_history.dart';
import '../bloc/transaction_history_bloc.dart';
import '../bloc/transaction_history_event.dart';
import '../bloc/transaction_history_state.dart';
import '../widgets/empty_state.dart';
import '../widgets/transaction_card.dart';
import '../widgets/transaction_header.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  final ScrollController _scrollController = ScrollController();
  late final TransactionHistoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<TransactionHistoryBloc>()
      ..add(TransactionHistoryLoadRequested());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _bloc.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _bloc.add(TransactionHistoryLoadMore());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8); // Trigger at 80% scroll
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        appBar: AppBar(
          title: const Text('Transaction History'),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        ),
        body: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
          builder: (context, state) {
            if (state is TransactionHistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionHistoryError) {
              return Center(
                child: Text(state.message ?? "Something went wrong"),
              );
            } else if (state is TransactionHistoryLoaded) {
              return _buildContent(context, state);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, TransactionHistoryLoaded state) {
    final filteredGroups = _filterGroups(state);

    return Column(
      children: [
        /// Header with search and filters
        TransactionHeader(
          selectedFilter: state.activeFilter,
          onFilterChanged: (filter) {
            context.read<TransactionHistoryBloc>().add(
              TransactionHistoryFilterChanged(filter),
            );
          },
          onSearchChanged: (query) {
            context.read<TransactionHistoryBloc>().add(
              TransactionHistorySearchChanged(query),
            );
          },
        ),

        /// Transaction List
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.all(16.r),
            children: [
              ...filteredGroups.map(
                (group) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader(Theme.of(context), group.title),
                    TransactionCard(transactions: group.transactions),
                    16.verticalSpace,
                  ],
                ),
              ),

              // Loading indicator at bottom
              if (state.isLoadingMore)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.r),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              // if (!state.hasReachedMax && filteredGroups.isNotEmpty)

              /// End of list message
              if (state.hasReachedMax && filteredGroups.isNotEmpty)
                const EmptyStateWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.r),
      child: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  List<TransactionGroup> _filterGroups(TransactionHistoryLoaded state) {
    return state.data?.groups
            .map((group) {
              final filteredTransactions = group.transactions.where((
                transaction,
              ) {
                // Filter by type
                if (state.activeFilter != null &&
                    transaction.type != state.activeFilter) {
                  return false;
                }

                // Filter by search query
                if (state.searchQuery?.isNotEmpty ?? false) {
                  final query = state.searchQuery?.toLowerCase();
                  return transaction.type.name.toLowerCase().contains(
                        query ?? "",
                      ) ||
                      transaction.amount.toString().contains(query ?? "");
                }

                return true;
              }).toList();

              return TransactionGroup(
                title: group.title,
                transactions: filteredTransactions,
              );
            })
            .where((group) => group.transactions.isNotEmpty)
            .toList() ??
        [];
  }
}
