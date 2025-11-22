import '../models/transaction_history_model.dart';

abstract class TransactionHistoryRemoteDataSource {
  Future<TransactionHistoryModel> getTransactionHistory({int page = 1});
}

class TransactionHistoryRemoteDataSourceImpl
    implements TransactionHistoryRemoteDataSource {
  static const int _itemsPerPage = 10;
  static const int _maxPages = 5; // Total 50 transactions

  @override
  Future<TransactionHistoryModel> getTransactionHistory({int page = 1}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Return empty if beyond max pages
    if (page > _maxPages) {
      return TransactionHistoryModel(groups: []);
    }

    // Generate mock data based on page
    return TransactionHistoryModel(groups: _generateTransactionsForPage(page));
  }

  List<TransactionGroupModel> _generateTransactionsForPage(int page) {
    final List<TransactionGroupModel> groups = [];
    final now = DateTime.now();

    // Calculate offset based on page
    final startIndex = (page - 1) * _itemsPerPage;

    // Generate transactions for this page
    for (int i = 0; i < _itemsPerPage; i++) {
      final transactionIndex = startIndex + i;
      final daysAgo = transactionIndex ~/ 3; // Group every 3 transactions
      final date = now.subtract(Duration(days: daysAgo));

      final String title;
      if (daysAgo == 0) {
        title = 'Today';
      } else if (daysAgo == 1) {
        title = 'Yesterday';
      } else {
        title = '${_monthName(date.month)} ${date.day}, ${date.year}';
      }

      // Check if group already exists
      final existingGroupIndex = groups.indexWhere((g) => g.title == title);

      final transaction = _generateTransaction(transactionIndex, date);

      if (existingGroupIndex != -1) {
        // Add to existing group
        final existingGroup = groups[existingGroupIndex];
        groups[existingGroupIndex] = TransactionGroupModel(
          title: existingGroup.title,
          transactions: [...?existingGroup.transactions, transaction],
        );
      } else {
        // Create new group
        groups.add(
          TransactionGroupModel(title: title, transactions: [transaction]),
        );
      }
    }

    return groups;
  }

  TransactionItemModel _generateTransaction(int index, DateTime date) {
    final types = ['deposit', 'withdraw', 'transfer'];
    final statuses = ['completed', 'pending'];

    final type = types[index % types.length];
    final status = index % 5 == 0
        ? statuses[1]
        : statuses[0]; // Every 5th is pending
    final amount = (index % 10 + 1) * 100.0 + (index % 100);
    final hour = 9 + (index % 8);
    final minute = (index * 15) % 60;

    return TransactionItemModel(
      id: 'txn_${index + 1}',
      type: type,
      amount: amount,
      time:
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${hour >= 12 ? 'PM' : 'AM'}',
      status: status,
      date: DateTime(date.year, date.month, date.day, hour, minute),
    );
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
