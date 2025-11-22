import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/fund_transaction_repository.dart';

class VerifyOtp implements UseCase<void, VerifyOtpParams> {
  final FundTransactionRepository repository;

  VerifyOtp(this.repository);

  @override
  Future<Either<Failure, void>> call(VerifyOtpParams params) async {
    return await repository.verifyOtp(params);
  }
}

class VerifyOtpParams extends Equatable {
  final String otp;
  final String transactionId;

  const VerifyOtpParams({
    required this.otp,
    required this.transactionId,
  });

  @override
  List<Object> get props => [otp, transactionId];
}
