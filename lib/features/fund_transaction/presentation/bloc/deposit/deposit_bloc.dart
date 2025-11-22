import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/deposit_funds.dart';
import '../../../domain/usecases/verify_otp.dart';
import 'deposit_event.dart';
import 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositFunds depositFunds;
  final VerifyOtp verifyOtp;

  DepositBloc({required this.depositFunds, required this.verifyOtp})
    : super(DepositInitial()) {
    on<DepositAmountChanged>(_onAmountChanged);
    on<SubmitDeposit>(_onSubmitDeposit);
    on<ConfirmDeposit>(_onConfirmDeposit);
    on<VerifyOtpRequested>(_onVerifyOtpRequested);
  }

  void _onAmountChanged(
    DepositAmountChanged event,
    Emitter<DepositState> emit,
  ) {
    final amount = double.tryParse(event.amount) ?? 0.0;
    if (amount > 0) {
      emit(DepositAmountValid(amount));
    } else {
      emit(DepositInitial());
    }
  }

  void _onSubmitDeposit(SubmitDeposit event, Emitter<DepositState> emit) {
    // In a real app, you might fetch account details here or pass them in
    emit(
      DepositConfirmationReady(
        amount: event.amount,
        accountName: 'Bank of America', // Mock data
        accountNumber: '**** 2891', // Mock data
      ),
    );
  }

  Future<void> _onConfirmDeposit(
    ConfirmDeposit event,
    Emitter<DepositState> emit,
  ) async {
    emit(DepositLoading());
    final result = await depositFunds(
      DepositFundsParams(amount: event.amount, accountId: 'mock_account_id'),
    );

    result.fold(
      (failure) => emit(DepositError(failure.message)),
      (_) => emit(const OtpRequired('mock_transaction_id')),
    );
  }

  Future<void> _onVerifyOtpRequested(
    VerifyOtpRequested event,
    Emitter<DepositState> emit,
  ) async {
    emit(DepositLoading());
    final result = await verifyOtp(
      VerifyOtpParams(otp: event.otp, transactionId: event.transactionId),
    );

    result.fold(
      (failure) => emit(DepositError(failure.message)),
      (_) => emit(DepositSuccess()),
    );
  }
}
