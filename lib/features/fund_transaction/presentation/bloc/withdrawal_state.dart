import 'package:equatable/equatable.dart';

import '../../domain/entities/withdrawal_info.dart';

abstract class WithdrawalState extends Equatable {
  const WithdrawalState();

  @override
  List<Object?> get props => [];
}

class WithdrawalInitial extends WithdrawalState {}

class WithdrawalLoading extends WithdrawalState {}

class WithdrawalLoaded extends WithdrawalState {
  final WithdrawalInfo info;
  final double inputAmount;
  final LinkedAccount? selectedAccount;
  final bool isAmountValid;
  final String? errorMessage;
  final bool isProgrammaticUpdate;
  final bool isSubmitting;

  const WithdrawalLoaded({
    required this.info,
    this.inputAmount = 0.0,
    this.selectedAccount,
    this.isAmountValid = true,
    this.errorMessage,
    this.isSubmitting = false,
    this.isProgrammaticUpdate = false,
  });

  WithdrawalLoaded copyWith({
    WithdrawalInfo? info,
    double? inputAmount,
    LinkedAccount? selectedAccount,
    bool? isAmountValid,
    String? errorMessage,
    bool? isSubmitting,
    bool? isProgrammaticUpdate,
  }) {
    return WithdrawalLoaded(
      info: info ?? this.info,
      inputAmount: inputAmount ?? this.inputAmount,
      selectedAccount: selectedAccount ?? this.selectedAccount,
      isAmountValid: isAmountValid ?? this.isAmountValid,
      errorMessage: errorMessage,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isProgrammaticUpdate: isProgrammaticUpdate ?? false,
    );
  }

  @override
  List<Object?> get props => [
    info,
    inputAmount,
    selectedAccount,
    isAmountValid,
    errorMessage,
    isSubmitting,
    isProgrammaticUpdate,
  ];
}

class WithdrawalSuccess extends WithdrawalState {}

class WithdrawalError extends WithdrawalState {
  final String message;

  const WithdrawalError(this.message);

  @override
  List<Object?> get props => [message];
}
