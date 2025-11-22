import '../models/dashboard_data_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardDataModel> getDashboardData();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  @override
  Future<DashboardDataModel> getDashboardData() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    /// Mock data with 10 transactions
    return DashboardDataModel(
      currentBalance: 12500.50,
      availableBalance: 11000.00,
      recentTransactions: [
        TransactionModel(
          id: '1',
          title: 'Salary Deposit',
          amount: 3000.00,
          date: DateTime.now().subtract(const Duration(days: 1)),
          isIncome: true,
        ),
        TransactionModel(
          id: '2',
          title: 'Grocery Shopping',
          amount: 150.75,
          date: DateTime.now().subtract(const Duration(days: 2)),
          isIncome: false,
        ),
        TransactionModel(
          id: '3',
          title: 'Freelance Work',
          amount: 500.00,
          date: DateTime.now().subtract(const Duration(days: 3)),
          isIncome: true,
        ),
        TransactionModel(
          id: '4',
          title: 'Electric Bill',
          amount: 120.00,
          date: DateTime.now().subtract(const Duration(days: 5)),
          isIncome: false,
        ),
        TransactionModel(
          id: '5',
          title: 'Investment Return',
          amount: 750.00,
          date: DateTime.now().subtract(const Duration(days: 7)),
          isIncome: true,
        ),
        TransactionModel(
          id: '6',
          title: 'Restaurant',
          amount: 85.50,
          date: DateTime.now().subtract(const Duration(days: 8)),
          isIncome: false,
        ),
        TransactionModel(
          id: '7',
          title: 'Consulting Fee',
          amount: 1200.00,
          date: DateTime.now().subtract(const Duration(days: 10)),
          isIncome: true,
        ),
        TransactionModel(
          id: '8',
          title: 'Internet Bill',
          amount: 60.00,
          date: DateTime.now().subtract(const Duration(days: 12)),
          isIncome: false,
        ),
        TransactionModel(
          id: '9',
          title: 'Bonus',
          amount: 500.00,
          date: DateTime.now().subtract(const Duration(days: 14)),
          isIncome: true,
        ),
        TransactionModel(
          id: '10',
          title: 'Gas Station',
          amount: 45.00,
          date: DateTime.now().subtract(const Duration(days: 15)),
          isIncome: false,
        ),
      ],
    );
  }
}
