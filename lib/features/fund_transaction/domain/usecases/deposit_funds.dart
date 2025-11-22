import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/fund_transaction_repository.dart';

class DepositFunds implements UseCase<void, DepositFundsParams> {
  final FundTransactionRepository repository;

  DepositFunds(this.repository);

  @override
  Future<Either<Failure, void>> call(DepositFundsParams params) async {
    return await repository.depositFunds(params);
  }
}

class DepositFundsParams extends Equatable {
  final double amount;
  final String accountId;

  const DepositFundsParams({
    required this.amount,
    required this.accountId,
  });

  @override
  List<Object> get props => [amount, accountId];
}
