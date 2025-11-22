import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 64.r),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 96.r,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          24.verticalSpace,
          Text(
            'No more transactions',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          4.verticalSpace,
          Text(
            'You\'ve reached the end of your transaction history.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
