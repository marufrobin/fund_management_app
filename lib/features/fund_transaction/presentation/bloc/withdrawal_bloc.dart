import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_withdrawal_info.dart';
import '../../domain/usecases/withdraw_funds.dart';
import 'withdrawal_event.dart';
import 'withdrawal_state.dart';

class WithdrawalBloc extends Bloc<WithdrawalEvent, WithdrawalState> {
  final GetWithdrawalInfo getWithdrawalInfo;
  final WithdrawFunds withdrawFunds;

  WithdrawalBloc({required this.getWithdrawalInfo, required this.withdrawFunds})
    : super(WithdrawalInitial()) {
    on<LoadWithdrawalInfo>(_onLoadWithdrawalInfo);
    on<AmountChanged>(_onAmountChanged);
    on<AccountSelected>(_onAccountSelected);
    on<QuickAmountSelected>(_onQuickAmountSelected);
    on<SubmitWithdrawal>(_onSubmitWithdrawal);
  }

  Future<void> _onLoadWithdrawalInfo(
    LoadWithdrawalInfo event,
    Emitter<WithdrawalState> emit,
  ) async {
    emit(WithdrawalLoading());
    final result = await getWithdrawalInfo(NoParams());
    result.fold(
      (failure) =>
          emit(const WithdrawalError('Failed to load withdrawal info')),
      (info) => emit(
        WithdrawalLoaded(
          info: info,
          selectedAccount: info.linkedAccounts.isNotEmpty
              ? info.linkedAccounts.first
              : null,
        ),
      ),
    );
  }

  void _onAmountChanged(AmountChanged event, Emitter<WithdrawalState> emit) {
    if (state is WithdrawalLoaded) {
      final currentState = state as WithdrawalLoaded;
      final amount = double.tryParse(event.amount) ?? 0.0;
      emit(
        currentState.copyWith(
          inputAmount: amount,
          isAmountValid: amount <= currentState.info.availableBalance,
          errorMessage: amount > currentState.info.dailyLimit
              ? 'Your requested amount exceeds the daily limit of \$${currentState.info.dailyLimit}'
              : null,
          isProgrammaticUpdate: false,
        ),
      );
    }
  }

  void _onAccountSelected(
    AccountSelected event,
    Emitter<WithdrawalState> emit,
  ) {
    if (state is WithdrawalLoaded) {
      final currentState = state as WithdrawalLoaded;
      emit(currentState.copyWith(selectedAccount: event.account));
    }
  }

  void _onQuickAmountSelected(
    QuickAmountSelected event,
    Emitter<WithdrawalState> emit,
  ) {
    if (state is WithdrawalLoaded) {
      final currentState = state as WithdrawalLoaded;
      final amount = currentState.info.availableBalance * event.percentage;
      // Round to 2 decimal places
      final roundedAmount = double.parse(amount.toStringAsFixed(2));

      emit(
        currentState.copyWith(
          inputAmount: roundedAmount,
          isAmountValid: true,
          errorMessage: roundedAmount > currentState.info.dailyLimit
              ? 'Your requested amount exceeds the daily limit of \$${currentState.info.dailyLimit}'
              : null,
          isProgrammaticUpdate: true,
        ),
      );
    }
  }

  Future<void> _onSubmitWithdrawal(
    SubmitWithdrawal event,
    Emitter<WithdrawalState> emit,
  ) async {
    if (state is WithdrawalLoaded) {
      final currentState = state as WithdrawalLoaded;
      if (currentState.selectedAccount == null) return;

      emit(currentState.copyWith(isSubmitting: true));

      final result = await withdrawFunds(
        WithdrawFundsParams(
          amount: currentState.inputAmount,
          accountId: currentState.selectedAccount!.id,
        ),
      );

      result?.fold(
        (failure) => emit(const WithdrawalError('Withdrawal failed')),
        (success) => emit(WithdrawalSuccess()),
      );
    }
  }
}
