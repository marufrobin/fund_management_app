import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/withdrawal_info.dart';
import '../usecases/withdraw_funds.dart';
import '../usecases/deposit_funds.dart';
import '../usecases/verify_otp.dart';

abstract class FundTransactionRepository {
  Future<Either<Failure, WithdrawalInfo>> getWithdrawalInfo();
  Future<Either<Failure, void>> withdrawFunds(WithdrawFundsParams params);
  Future<Either<Failure, void>> depositFunds(DepositFundsParams params);
  Future<Either<Failure, void>> verifyOtp(VerifyOtpParams params);
}
