import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/app_button.dart';
import '../../../../core/config/injection_container.dart';
import '../bloc/fund_details_bloc.dart';
import '../bloc/fund_details_event.dart';
import '../bloc/fund_details_state.dart';
import '../widgets/fund_performance_chart.dart';

class FundDetailsPage extends StatelessWidget {
  const FundDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FundDetailsBloc>()..add(const LoadFundDetails()),
      child: const _FundDetailsView(),
    );
  }
}

class _FundDetailsView extends StatelessWidget {
  const _FundDetailsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Portfolio Overview'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<FundDetailsBloc, FundDetailsState>(
        builder: (context, state) {
          if (state is FundDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FundDetailsError) {
            return Center(child: Text(state.message));
          } else if (state is FundDetailsLoaded) {
            return _buildContent(context, state);
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildContent(BuildContext context, FundDetailsLoaded state) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildStatsCards(context, state),
          24.verticalSpace,
          _buildChartSection(context, state),
          24.verticalSpace,
          _buildBreakdownList(context, state),
          80.verticalSpace, // Space for bottom bar
        ],
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context, FundDetailsLoaded state) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            'Total Investment',
            '\$${state.fundDetails.totalInvestment.toStringAsFixed(0)}',
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            'Current Value',
            '\$${state.fundDetails.currentValue.toStringAsFixed(0)}',
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: _buildStatCard(
            context,
            'Profit',
            '+\$${state.fundDetails.profit.toStringAsFixed(0)}',
            subtitle: '+${state.fundDetails.profitPercentage.toStringAsFixed(2)}%',
            isPositive: true,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value, {
    String? subtitle,
    bool isPositive = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          8.verticalSpace,
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isPositive ? Colors.green : null,
                ),
          ),
          if (subtitle != null) ...[
            4.verticalSpace,
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isPositive ? Colors.green : null,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChartSection(BuildContext context, FundDetailsLoaded state) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fund Performance',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          8.verticalSpace,
          Text(
            '\$${state.fundDetails.currentValue.toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Row(
            children: [
              Text(
                'Last ${state.selectedTimePeriod}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              8.horizontalSpace,
              Text(
                '+${state.fundDetails.profitPercentage.toStringAsFixed(2)}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          24.verticalSpace,
          _buildTimePeriodSelector(context, state.selectedTimePeriod),
          24.verticalSpace,
          SizedBox(
            height: 200.h,
            child: FundPerformanceChart(data: state.fundDetails.chartData),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePeriodSelector(BuildContext context, String selectedPeriod) {
    final periods = ['1M', '3M', '6M', '1Y', 'All'];
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: periods.map((period) {
          final isSelected = period == selectedPeriod;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<FundDetailsBloc>().add(LoadFundDetails(period));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  period,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBreakdownList(BuildContext context, FundDetailsLoaded state) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildBreakdownItem(
            context,
            'Invested Amount',
            '\$${state.fundDetails.totalInvestment.toStringAsFixed(0)}',
          ),
          Divider(color: Theme.of(context).dividerColor.withOpacity(0.1)),
          _buildBreakdownItem(
            context,
            'Total Returns',
            '\$${state.fundDetails.profit.toStringAsFixed(0)}',
            valueColor: Colors.green,
          ),
          Divider(color: Theme.of(context).dividerColor.withOpacity(0.1)),
          _buildBreakdownItem(
            context,
            'Return %',
            '${state.fundDetails.profitPercentage.toStringAsFixed(2)}%',
            valueColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownItem(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.r),
      child: Row(
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
                  fontWeight: FontWeight.w600,
                  color: valueColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              buttonLabel: 'Withdraw',
              variant: ButtonVariant.OUTLINED,
              onPressed: () => context.push('/withdraw'),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: AppButton(
              buttonLabel: 'Invest More',
              onPressed: () => context.push('/deposit'),
            ),
          ),
        ],
      ),
    );
  }
}
