import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_management_app/core/config/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/app_button.dart';
import '../../../../core/config/injection_container.dart';
import '../bloc/deposit/deposit_bloc.dart';
import '../bloc/deposit/deposit_event.dart';
import '../bloc/deposit/deposit_state.dart';

class DepositFundPage extends StatelessWidget {
  const DepositFundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DepositBloc>(),
      child: const _DepositFundView(),
    );
  }
}

class _DepositFundView extends StatefulWidget {
  const _DepositFundView();

  @override
  State<_DepositFundView> createState() => _DepositFundViewState();
}

class _DepositFundViewState extends State<_DepositFundView> {
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DepositBloc, DepositState>(
      listener: (context, state) {
        if (state is DepositConfirmationReady) {
          _showConfirmationBottomSheet(context, state);
        } else if (state is OtpRequired) {
          context.push(
            '${AppRoutesNames.depositFundsScreen}/otp',
            extra: state.transactionId,
          );
        } else if (state is DepositError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text('Deposit Funds'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      _buildAmountInput(context),
                      24.verticalSpace,
                      _buildQuickAmountChips(context),
                    ],
                  ),
                ),
              ),
              _buildBottomAction(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountInput(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter Amount',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        16.verticalSpace,
        IntrinsicWidth(
          child: TextField(
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              prefixText: '\$',
              prefixStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              border: InputBorder.none,
              hintText: '0.00',
              hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              ),
            ),
            onChanged: (value) {
              context.read<DepositBloc>().add(DepositAmountChanged(value));
            },
          ),
        ),
        8.verticalSpace,
        Text(
          'Available Balance: \$98,320', // Mock data
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAmountChips(BuildContext context) {
    final amounts = [500, 1000, 5000, 10000];
    return Wrap(
      spacing: 12.r,
      runSpacing: 12.r,
      alignment: WrapAlignment.center,
      children: amounts.map((amount) {
        return ActionChip(
          label: Text('\$$amount'),
          onPressed: () {
            _amountController.text = amount.toString();
            context.read<DepositBloc>().add(
              DepositAmountChanged(amount.toString()),
            );
          },
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          labelStyle: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        );
      }).toList(),
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: BlocBuilder<DepositBloc, DepositState>(
        builder: (context, state) {
          final isValid =
              state is DepositAmountValid || state is DepositConfirmationReady;
          return AppButton(
            buttonLabel: 'Continue',
            isEnabled: isValid,
            onPressed: () {
              final amount = double.tryParse(_amountController.text) ?? 0.0;
              if (amount > 0) {
                context.read<DepositBloc>().add(SubmitDeposit(amount));
              }
            },
          );
        },
      ),
    );
  }

  void _showConfirmationBottomSheet(
    BuildContext context,
    DepositConfirmationReady state,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<DepositBloc>(),
        child: _ConfirmationBottomSheet(state: state),
      ),
    );
  }
}

class _ConfirmationBottomSheet extends StatelessWidget {
  final DepositConfirmationReady state;

  const _ConfirmationBottomSheet({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.all(24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Confirm Deposit',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                _buildDetailRow(
                  context,
                  'Amount',
                  '\$${state.amount.toStringAsFixed(2)}',
                  isBold: true,
                ),
                16.verticalSpace,
                _buildDetailRow(
                  context,
                  'From Account',
                  '${state.accountName} ${state.accountNumber}',
                ),
              ],
            ),
          ),
          24.verticalSpace,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  buttonLabel: 'Cancel',
                  variant: ButtonVariant.OUTLINED,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: AppButton(
                  buttonLabel: 'Confirm',
                  onPressed: () {
                    context.read<DepositBloc>().add(
                      ConfirmDeposit(state.amount),
                    );
                    Navigator.pop(
                      context,
                    ); // Close sheet, logic handles navigation
                  },
                ),
              ),
            ],
          ),
          24.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
