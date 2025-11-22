import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/withdrawal_info.dart';
import '../../domain/repositories/fund_transaction_repository.dart';
import '../../domain/usecases/deposit_funds.dart';
import '../../domain/usecases/verify_otp.dart';
import '../../domain/usecases/withdraw_funds.dart';
import '../datasources/fund_transaction_remote_data_source.dart';

class FundTransactionRepositoryImpl implements FundTransactionRepository {
  final FundTransactionRemoteDataSource remoteDataSource;

  FundTransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WithdrawalInfo>> getWithdrawalInfo() async {
    try {
      final result = await remoteDataSource.getWithdrawalInfo();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> withdrawFunds(
    WithdrawFundsParams params,
  ) async {
    try {
      await remoteDataSource.withdrawFunds(
        amount: params.amount,
        accountId: params.accountId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> depositFunds(DepositFundsParams params) async {
    try {
      await remoteDataSource.depositFunds(
        amount: params.amount,
        accountId: params.accountId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(VerifyOtpParams params) async {
    try {
      await remoteDataSource.verifyOtp(
        otp: params.otp,
        transactionId: params.transactionId,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
