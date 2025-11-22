import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/transaction_history.dart';

class FilterChips extends StatelessWidget {
  final TransactionType? selectedFilter;
  final Function(TransactionType?) onFilterChanged;

  const FilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
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
          return Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: FilterChip(
              label: Text(entry.key),
              selected: isSelected,
              onSelected: (selected) {
                onFilterChanged(entry.value);
              },
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              selectedColor: Theme.of(context).colorScheme.primaryContainer,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.onSurface,
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
