import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/app_button.dart';
import '../../../../core/common/widgets/app_text_field.dart';
import '../../../../core/config/app_routes.dart';
import '../../../../core/utils/app_toaster.dart';
import '../../../../core/utils/ui_utils.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            AppToaster.success(message: 'Login Successful', context: context);
            context.go(AppRoutesNames.dashboardScreen);
          } else if (state is AuthError) {
            AppToaster.error(message: state.message, context: context);
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.surfaceContainer,
                Theme.of(context).colorScheme.surface,
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _logoWidget(context),
                  32.verticalSpace,

                  /// Login Card
                  _loginCardWidget(context),
                  24.verticalSpace,

                  // Sign Up Link
                  _signUpWidget(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _logoWidget(BuildContext context) {
    return Container(
      height: 60.r,
      width: 60.r,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.show_chart, color: Colors.white, size: 32.r),
    );
  }

  Row _signUpWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        GestureDetector(
          onTap: () {
            AppToaster.info(
              message: 'Sign Up feature coming soon',
              context: context,
            );
          },
          child: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Container _loginCardWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            8.verticalSpace,
            Text(
              'Log in to your account',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            32.verticalSpace,

            /// Email Input
            AppTextFormField(
              controller: _emailController,
              title: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(
                Icons.person_outline,
                size: 20.r,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
            10.verticalSpace,

            /// Password Input
            AppTextFormField(
              controller: _passwordController,
              title: 'Password',
              hintText: 'Enter your password',
              obscureText: !_isPasswordVisible,
              prefixIcon: Icon(
                Icons.lock_outline,
                size: 20.r,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              suffixIcon: _passwordVisibleWidget(context),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
              ]),
            ),
            16.verticalSpace,

            /// Remember Me & Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  AppToaster.info(
                    message: 'Forgot Password feature coming soon',
                    context: context,
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            24.verticalSpace,

            /// Login Button
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return AppButton(
                  buttonLabel: 'Login',
                  isFullWidth: true,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    closeKeyboardOnClick();
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<AuthBloc>().add(
                        LoginRequested(
                          email: _emailController.text,
                          password: _passwordController.text,
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
    );
  }

  IconButton _passwordVisibleWidget(BuildContext context) {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Icon(
          _isPasswordVisible
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          key: ValueKey<bool>(_isPasswordVisible),
          // Key is essential for AnimatedSwitcher
          size: 20.r,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }
}
