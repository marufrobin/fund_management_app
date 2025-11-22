import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fund_management_app/core/config/app_routes.dart';
import 'package:fund_management_app/core/utils/app_toaster.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/widgets/app_button.dart';
import '../../../../core/config/injection_container.dart';
import '../bloc/deposit/deposit_bloc.dart';
import '../bloc/deposit/deposit_event.dart';
import '../bloc/deposit/deposit_state.dart';

class OtpVerificationPage extends StatelessWidget {
  final String transactionId;

  const OtpVerificationPage({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DepositBloc>(),
      child: _OtpVerificationView(transactionId: transactionId),
    );
  }
}

class _OtpVerificationView extends StatefulWidget {
  final String transactionId;

  const _OtpVerificationView({required this.transactionId});

  @override
  State<_OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<_OtpVerificationView> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.r,
      height: 56.r,
      textStyle: Theme.of(
        context,
      ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return BlocListener<DepositBloc, DepositState>(
      listener: (context, state) {
        if (state is DepositSuccess) {
          context.go(AppRoutesNames.dashboardScreen);
          AppToaster.success(message: 'Deposit Successful!', context: context);
        } else if (state is DepositError) {
          AppToaster.error(message: state.message, context: context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text('Verify Transaction'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                Text(
                  'Enter the code sent to\n+880 17***89',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                32.verticalSpace,
                Pinput(
                  controller: _otpController,
                  length: 4,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  onCompleted: (pin) {
                    context.read<DepositBloc>().add(
                      VerifyOtpRequested(
                        otp: pin,
                        transactionId: widget.transactionId,
                      ),
                    );
                  },
                ),
                32.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resend Code in ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '00:30',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                BlocBuilder<DepositBloc, DepositState>(
                  builder: (context, state) {
                    return AppButton(
                      buttonLabel: 'Verify',
                      isLoading: state is DepositLoading,
                      onPressed: () {
                        if (_otpController.text.length == 4) {
                          context.read<DepositBloc>().add(
                            VerifyOtpRequested(
                              otp: _otpController.text,
                              transactionId: widget.transactionId,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
