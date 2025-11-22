import 'package:equatable/equatable.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent();

  @override
  List<Object> get props => [];
}

class DepositAmountChanged extends DepositEvent {
  final String amount;

  const DepositAmountChanged(this.amount);

  @override
  List<Object> get props => [amount];
}

class SubmitDeposit extends DepositEvent {
  final double amount;

  const SubmitDeposit(this.amount);

  @override
  List<Object> get props => [amount];
}

class ConfirmDeposit extends DepositEvent {
  final double amount;

  const ConfirmDeposit(this.amount);

  @override
  List<Object> get props => [amount];
}

class VerifyOtpRequested extends DepositEvent {
  final String otp;
  final String transactionId;

  const VerifyOtpRequested({required this.otp, required this.transactionId});

  @override
  List<Object> get props => [otp, transactionId];
}
