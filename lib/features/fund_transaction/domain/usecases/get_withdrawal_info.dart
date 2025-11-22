import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/withdrawal_info.dart';
import '../repositories/fund_transaction_repository.dart';

class GetWithdrawalInfo implements UseCase<WithdrawalInfo, NoParams> {
  final FundTransactionRepository repository;

  GetWithdrawalInfo(this.repository);

  @override
  Future<Either<Failure, WithdrawalInfo>> call(NoParams params) async {
    return await repository.getWithdrawalInfo();
  }
}
