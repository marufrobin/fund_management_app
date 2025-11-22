import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/fund_transaction_repository.dart';

class WithdrawFunds implements UseCase<void, WithdrawFundsParams> {
  final FundTransactionRepository repository;

  WithdrawFunds(this.repository);

  @override
  Future<Either<Failure, void>> call(WithdrawFundsParams params) async {
    return await repository.withdrawFunds(params);
  }
}

class WithdrawFundsParams extends Equatable {
  final double amount;
  final String accountId;

  const WithdrawFundsParams({required this.amount, required this.accountId});

  @override
  List<Object?> get props => [amount, accountId];
}
