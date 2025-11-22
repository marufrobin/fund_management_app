import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/app_text_field.dart';
import '../../domain/entities/transaction_history.dart';

class TransactionHeader extends StatelessWidget {
  final TransactionType? selectedFilter;
  final Function(TransactionType?) onFilterChanged;
  final Function(String) onSearchChanged;

  const TransactionHeader({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          // Search Bar
          _buildSearchBar(theme),
          16.verticalSpace,

          // Filter Chips
          _buildFilterChips(theme),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return AppTextField(
      hintText: 'Search transactions...',
      onChanged: onSearchChanged,
      fillColor: theme.colorScheme.surfaceContainerHighest,
    );
  }

  Widget _buildFilterChips(ThemeData theme) {
    final filters = <String, TransactionType?>{
      'All': null,
      'Deposit': TransactionType.deposit,
      'Withdraw': TransactionType.withdraw,
      'Transfer': TransactionType.transfer,
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.entries.map((entry) {
          final isSelected = entry.value == selectedFilter;
          return Container(
            padding: EdgeInsets.only(right: 10.r),
            child: FilterChip(
              label: Text(entry.key),
              selected: isSelected,
              onSelected: (selected) {
                onFilterChanged(entry.value);
              },
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              selectedColor: theme.colorScheme.primaryContainer,
              labelStyle: TextStyle(
                color: isSelected
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide.none,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
