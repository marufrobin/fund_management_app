import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_management_app/core/utils/app_toaster.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/app_button.dart';
import '../../../../core/config/injection_container.dart';
import '../../domain/entities/withdrawal_info.dart';
import '../bloc/withdrawal_bloc.dart';
import '../bloc/withdrawal_event.dart';
import '../bloc/withdrawal_state.dart';

class WithdrawFundPage extends StatelessWidget {
  const WithdrawFundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WithdrawalBloc>()..add(LoadWithdrawalInfo()),
      child: BlocListener<WithdrawalBloc, WithdrawalState>(
        listener: (context, state) {
          if (state is WithdrawalSuccess) {
            AppToaster.success(
              message: 'Withdrawal request submitted successfully',
              context: context,
            );
            context.pop();
          } else if (state is WithdrawalError) {
            AppToaster.error(message: state.message, context: context);
          }
        },
        child: const _WithdrawFundView(),
      ),
    );
  }
}

class _WithdrawFundView extends StatefulWidget {
  const _WithdrawFundView();

  @override
  State<_WithdrawFundView> createState() => _WithdrawFundViewState();
}

class _WithdrawFundViewState extends State<_WithdrawFundView> {
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Fund Withdrawal'),
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocConsumer<WithdrawalBloc, WithdrawalState>(
          listener: (context, state) {
            if (state is WithdrawalLoaded && state.isProgrammaticUpdate) {
              _amountController.text = state.inputAmount.toString();

              /// Move cursor to end
              _amountController.selection = TextSelection.fromPosition(
                TextPosition(offset: _amountController.text.length),
              );
            }
          },
          builder: (context, state) {
            if (state is WithdrawalLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WithdrawalLoaded) {
              return _buildContent(context, state);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WithdrawalLoaded state) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBalanceCard(context, state.info.availableBalance),
                24.verticalSpace,
                _buildAccountSelector(context, state),
                24.verticalSpace,
                _buildAmountInput(context, state),
                16.verticalSpace,
                _buildQuickAmountButtons(context),
                if (state.errorMessage != null) ...[
                  24.verticalSpace,
                  _buildWarningBanner(context, state.errorMessage!),
                ],
                24.verticalSpace,
                _buildBalancePreview(context, state),
              ],
            ),
          ),
        ),
        _buildBottomAction(context, state),
      ],
    );
  }

  Widget _buildBalanceCard(BuildContext context, double balance) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available to Withdraw',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              4.verticalSpace,
              Text(
                '৳${balance.toStringAsFixed(2)}',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_balance_wallet,
              color: theme.colorScheme.primary,
              size: 24.r,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSelector(BuildContext context, WithdrawalLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Withdraw From',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        8.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 4.r),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<LinkedAccount>(
              value: state.selectedAccount,
              isExpanded: true,
              hint: const Text('Select Account'),
              items: state.info.linkedAccounts.map((account) {
                return DropdownMenuItem(
                  value: account,
                  child: Text('${account.name} - ${account.accountNumber}'),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<WithdrawalBloc>().add(AccountSelected(value));
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAmountInput(BuildContext context, WithdrawalLoaded state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Amount',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        8.verticalSpace,
        TextFormField(
          controller: _amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textAlign: TextAlign.right,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: EdgeInsets.all(16.r),
              child: Text(
                '৳',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            hintText: '0.00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.r,
              vertical: 20.r,
            ),
          ),
          onChanged: (value) {
            context.read<WithdrawalBloc>().add(AmountChanged(value));
          },
        ),
      ],
    );
  }

  Widget _buildQuickAmountButtons(BuildContext context) {
    final percentages = [0.10, 0.25, 0.50, 1.0];
    final labels = ['10%', '25%', '50%', 'Max'];
    final theme = Theme.of(context);

    return Row(
      children: List.generate(percentages.length, (index) {
        return Expanded(
          child: Container(
            padding: EdgeInsets.only(
              right: index < percentages.length - 1 ? 8.r : 0,
            ),
            child: InkWell(
              onTap: () {
                context.read<WithdrawalBloc>().add(
                  QuickAmountSelected(percentages[index]),
                );
              },
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[index],
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildWarningBanner(BuildContext context, String message) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Theme.of(context).colorScheme.error,
            size: 24.r,
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Withdrawal Limit Warning',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.verticalSpace,
                Text(
                  message,
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.error.withValues(alpha: 0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalancePreview(BuildContext context, WithdrawalLoaded state) {
    final newBalance = state.info.availableBalance - state.inputAmount;
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'New balance after withdrawal: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          children: [
            TextSpan(
              text: '৳${newBalance.toStringAsFixed(2)}',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context, WithdrawalLoaded state) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: AppButton(
        buttonLabel: 'Review Withdrawal',
        onPressed:
            state.isAmountValid &&
                state.inputAmount > 0 &&
                state.errorMessage == null
            ? () {
                context.read<WithdrawalBloc>().add(SubmitWithdrawal());
              }
            : () {},
        isLoading: state.isSubmitting,
        backgroundColor:
            state.isAmountValid &&
                state.inputAmount > 0 &&
                state.errorMessage == null
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).disabledColor,
      ),
    );
  }
}
