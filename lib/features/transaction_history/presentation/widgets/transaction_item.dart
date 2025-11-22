import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/transaction_history.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionItem transaction;

  const TransactionItemWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(14.r),
      child: Row(
        children: [
          // Icon
          _buildIcon(theme),
          16.horizontalSpace,

          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _capitalize(transaction.type.name),
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                Text(
                  transaction.time,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Amount and Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formattedAmount,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _amountColor(context),
                ),
              ),
              4.verticalSpace,
              _buildStatusBadge(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    Color backgroundColor;
    Color iconColor;
    IconData icon;

    switch (transaction.type) {
      case TransactionType.deposit:
        backgroundColor = Colors.green.withValues(alpha: 0.1);
        iconColor = Colors.green;
        icon = Icons.arrow_downward;
        break;
      case TransactionType.withdraw:
        if (transaction.status == TransactionStatus.pending) {
          backgroundColor = Colors.orange.withValues(alpha: 0.1);
          iconColor = Colors.orange;
        } else {
          backgroundColor = Colors.red.withValues(alpha: 0.1);
          iconColor = Colors.red;
        }
        icon = Icons.arrow_upward;
        break;
      case TransactionType.transfer:
        backgroundColor = theme.colorScheme.primary.withValues(alpha: 0.1);
        iconColor = theme.colorScheme.primary;
        icon = Icons.sync_alt;
        break;
    }

    return Container(
      width: 40.r,
      height: 40.r,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 20.r),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    final isCompleted = transaction.status == TransactionStatus.completed;
    final backgroundColor = isCompleted
        ? Colors.green.withOpacity(0.1)
        : Colors.orange.withOpacity(0.1);
    final textColor = isCompleted ? Colors.green : Colors.orange;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 2.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        _capitalize(transaction.status.name),
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  String get _formattedAmount {
    final sign = transaction.type == TransactionType.deposit ? '+' : '-';
    return '$sign \$${transaction.amount.toStringAsFixed(2)}';
  }

  Color _amountColor(BuildContext context) {
    return switch (transaction.type) {
      TransactionType.deposit => Colors.green,
      TransactionType.withdraw =>
        transaction.status == TransactionStatus.pending
            ? Colors.orange
            : Colors.red,
      TransactionType.transfer => Theme.of(context).colorScheme.onSurface,
    };
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
