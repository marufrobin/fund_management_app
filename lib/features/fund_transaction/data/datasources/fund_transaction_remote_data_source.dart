import '../models/withdrawal_info_model.dart';

abstract class FundTransactionRemoteDataSource {
  Future<WithdrawalInfoModel> getWithdrawalInfo();

  Future<void> withdrawFunds({
    required double amount,
    required String accountId,
  });

  Future<void> depositFunds({
    required double amount,
    required String accountId,
  });

  Future<void> verifyOtp({required String otp, required String transactionId});
}

class FundTransactionRemoteDataSourceImpl
    implements FundTransactionRemoteDataSource {
  @override
  Future<WithdrawalInfoModel> getWithdrawalInfo() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return const WithdrawalInfoModel(
      availableBalance: 150500.75,
      dailyLimit: 100000.00,
      linkedAccounts: [
        LinkedAccountModel(
          id: '1',
          name: 'BRAC EPL',
          accountNumber: '1204150068435161',
        ),
        LinkedAccountModel(
          id: '2',
          name: 'Savings Account',
          accountNumber: '12041500XXXXXX',
        ),
      ],
    );
  }

  @override
  Future<void> withdrawFunds({
    required double amount,
    required String accountId,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    // In a real app, you would make an API call here
  }

  @override
  Future<void> depositFunds({
    required double amount,
    required String accountId,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(microseconds: 500));
  }

  @override
  Future<void> verifyOtp({
    required String otp,
    required String transactionId,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(microseconds: 500));
    if (otp != '1234') {
      throw Exception('Invalid OTP');
    }
  }
}
