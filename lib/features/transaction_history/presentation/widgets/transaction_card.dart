import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/transaction_history.dart';
import 'transaction_item.dart';

class TransactionCard extends StatelessWidget {
  final List<TransactionItem> transactions;

  const TransactionCard({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (transactions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: transactions.asMap().entries.map((entry) {
          final index = entry.key;
          final transaction = entry.value;
          final isLast = index == transactions.length - 1;

          return Column(
            children: [
              TransactionItemWidget(transaction: transaction),
              if (!isLast)
                Divider(
                  height: 1,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                  indent: 14.r,
                  endIndent: 14.r,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
