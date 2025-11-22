import 'package:equatable/equatable.dart';

abstract class DepositState extends Equatable {
  const DepositState();

  @override
  List<Object?> get props => [];
}

class DepositInitial extends DepositState {}

class DepositLoading extends DepositState {}

class DepositAmountValid extends DepositState {
  final double amount;

  const DepositAmountValid(this.amount);

  @override
  List<Object> get props => [amount];
}

class DepositConfirmationReady extends DepositState {
  final double amount;
  final String accountName;
  final String accountNumber;

  const DepositConfirmationReady({
    required this.amount,
    required this.accountName,
    required this.accountNumber,
  });

  @override
  List<Object> get props => [amount, accountName, accountNumber];
}

class OtpRequired extends DepositState {
  final String transactionId;

  const OtpRequired(this.transactionId);

  @override
  List<Object> get props => [transactionId];
}

class DepositSuccess extends DepositState {}

class DepositError extends DepositState {
  final String message;

  const DepositError(this.message);

  @override
  List<Object> get props => [message];
}
