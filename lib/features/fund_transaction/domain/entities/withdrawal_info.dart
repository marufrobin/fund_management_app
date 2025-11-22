import 'package:equatable/equatable.dart';

class WithdrawalInfo extends Equatable {
  final double availableBalance;
  final double dailyLimit;
  final List<LinkedAccount> linkedAccounts;

  const WithdrawalInfo({
    required this.availableBalance,
    required this.dailyLimit,
    required this.linkedAccounts,
  });

  @override
  List<Object?> get props => [availableBalance, dailyLimit, linkedAccounts];
}

class LinkedAccount extends Equatable {
  final String id;
  final String name;
  final String accountNumber;

  const LinkedAccount({
    required this.id,
    required this.name,
    required this.accountNumber,
  });

  @override
  List<Object?> get props => [id, name, accountNumber];
}
