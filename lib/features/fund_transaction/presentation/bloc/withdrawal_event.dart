import 'package:equatable/equatable.dart';
import '../../domain/entities/withdrawal_info.dart';

abstract class WithdrawalEvent extends Equatable {
  const WithdrawalEvent();

  @override
  List<Object?> get props => [];
}

class LoadWithdrawalInfo extends WithdrawalEvent {}

class AmountChanged extends WithdrawalEvent {
  final String amount;

  const AmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class AccountSelected extends WithdrawalEvent {
  final LinkedAccount account;

  const AccountSelected(this.account);

  @override
  List<Object?> get props => [account];
}

class QuickAmountSelected extends WithdrawalEvent {
  final double percentage;

  const QuickAmountSelected(this.percentage);

  @override
  List<Object?> get props => [percentage];
}

class SubmitWithdrawal extends WithdrawalEvent {}
