import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_management_app/core/common/widgets/app_button.dart';
import 'package:fund_management_app/core/common/widgets/app_cached_network_image_widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_routes.dart';
import '../../../../core/config/injection_container.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../domain/entities/dashboard_data.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<DashboardBloc>()..add(DashboardLoadRequested()),
        ),
        BlocProvider(create: (_) => sl<AuthBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            // Navigate to login screen after successful logout
            context.go(AppRoutesNames.loginScreen);
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          appBar: _appBar(context),
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DashboardError) {
                return Center(child: Text(state.message));
              } else if (state is DashboardLoaded) {
                return _buildDashboardContent(context, state.data);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        PopupMenuButton<String>(
          icon: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(60.r)),
            child: AppCachedNetworkImage(
              imageURL: "https://avatars.githubusercontent.com/u/47666475?v=4",
            ),
          ),

          onSelected: (value) {
            if (value == 'logout') {
              // Dispatch logout event to AuthBloc
              context.read<AuthBloc>().add(LogoutRequested());
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'logout',
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  12.horizontalSpace,
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDashboardContent(BuildContext context, DashboardData data) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBalanceCard(context, data),
          24.verticalSpace,
          _buildActionButtons(context),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () =>
                    context.push(AppRoutesNames.transactionHistoryScreen),
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          _buildRecentTransactionsList(
            context: context,
            transactions: data.recentTransactions,
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context, DashboardData data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          8.verticalSpace,
          Text(
            '\$${data.currentBalance.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Balance',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
                Text(
                  '\$${data.availableBalance.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            label: 'Deposit',
            icon: Icons.add,
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () => context.push(AppRoutesNames.depositFundsScreen),
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: _buildActionButton(
            label: 'Withdraw',
            icon: Icons.remove,
            color: Theme.of(context).colorScheme.error,
            onPressed: () => context.push(AppRoutesNames.withdrawFundScreen),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return AppButton(
      onPressed: onPressed,
      buttonLabel: label,
      leading: Icon(icon, size: 20.r),
      backgroundColor: color,
    );
  }

  Widget _buildRecentTransactionsList({
    required BuildContext context,
    required List<Transaction> transactions,
  }) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return InkWell(
          onTap: () {
            context.pushNamed(AppRoutesNames.fundDetailsScreen);
          },
          child: Container(
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
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: transaction.isIncome
                        ? Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.1)
                        : Theme.of(
                            context,
                          ).colorScheme.error.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    transaction.isIncome
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: transaction.isIncome
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.error,
                    size: 20.r,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      4.verticalSpace,
                      Text(
                        _formatDate(transaction.date),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${transaction.isIncome ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: transaction.isIncome
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    // Simple date formatting, can be improved with intl package
    return '${date.day}/${date.month}/${date.year}';
  }
}
