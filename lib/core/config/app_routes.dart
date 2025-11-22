import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/fund_transaction/presentation/pages/deposit_fund_page.dart';
import '../../features/fund_transaction/presentation/pages/otp_verification_page.dart';
import '../../features/fund_transaction/presentation/pages/withdraw_fund_page.dart';
import '../../features/fund_details/presentation/pages/fund_details_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/transaction_history/presentation/pages/transaction_history_page.dart';

class AppRoutesNames {
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String dashboardScreen = "/dashboard_screen";
  static const String transactionHistoryScreen = "/transaction_history_screen";
  static const String fundDetailsScreen = "/fund_details_screen";
  static const String depositFundsScreen = "/deposit_funds_screen";
  static const String withdrawFundScreen = "/withdraw_fund_screen";
}

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutesConfiguration {
  static final GoRouter appRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutesNames.splashScreen,
    routes: [
      GoRoute(
        name: AppRoutesNames.splashScreen,
        path: AppRoutesNames.splashScreen,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: AppRoutesNames.loginScreen,
        path: AppRoutesNames.loginScreen,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: AppRoutesNames.dashboardScreen,
        path: AppRoutesNames.dashboardScreen,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: AppRoutesNames.transactionHistoryScreen,
        path: AppRoutesNames.transactionHistoryScreen,
        builder: (context, state) => const TransactionHistoryPage(),
      ),
      GoRoute(
        name: AppRoutesNames.fundDetailsScreen,
        path: AppRoutesNames.fundDetailsScreen,
        builder: (context, state) => const FundDetailsPage(),
      ),
      GoRoute(
        name: AppRoutesNames.withdrawFundScreen,
        path: AppRoutesNames.withdrawFundScreen,
        builder: (context, state) => const WithdrawFundPage(),
      ),
      GoRoute(
        name: AppRoutesNames.depositFundsScreen,
        path: AppRoutesNames.depositFundsScreen,
        builder: (context, state) => const DepositFundPage(),
        routes: [
          GoRoute(
            path: 'otp',
            builder: (context, state) {
              final transactionId = state.extra as String;
              return OtpVerificationPage(transactionId: transactionId);
            },
          ),
        ],
      ),
    ],
  );
}
