import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_user.dart';
import '../../features/auth/domain/usecases/logout_user.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../features/dashboard/domain/usecases/get_dashboard_data.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/fund_transaction/data/datasources/fund_transaction_remote_data_source.dart';
import '../../features/fund_transaction/data/repositories/fund_transaction_repository_impl.dart';
import '../../features/fund_transaction/domain/repositories/fund_transaction_repository.dart';
import '../../features/fund_transaction/domain/usecases/deposit_funds.dart';
import '../../features/fund_transaction/domain/usecases/get_withdrawal_info.dart';
import '../../features/fund_transaction/domain/usecases/verify_otp.dart';
import '../../features/fund_transaction/domain/usecases/withdraw_funds.dart';
import '../../features/fund_transaction/presentation/bloc/deposit/deposit_bloc.dart';
import '../../features/fund_transaction/presentation/bloc/withdrawal_bloc.dart';
import '../../features/fund_details/data/datasources/fund_details_remote_data_source.dart';
import '../../features/fund_details/data/repositories/fund_details_repository_impl.dart';
import '../../features/fund_details/domain/repositories/fund_details_repository.dart';
import '../../features/fund_details/domain/usecases/get_fund_details.dart';
import '../../features/fund_details/presentation/bloc/fund_details_bloc.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/transaction_history/data/datasources/transaction_history_remote_data_source.dart';
import '../../features/transaction_history/data/repositories/transaction_history_repository_impl.dart';
import '../../features/transaction_history/domain/repositories/transaction_history_repository.dart';
import '../../features/transaction_history/domain/usecases/get_transaction_history.dart';
import '../../features/transaction_history/presentation/bloc/transaction_history_bloc.dart';
import '../network/network_info.dart';
import '../storage/app_secure_storage.dart';
import '../storage/app_store_contract.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<AppStoreContract>(() => AppSecureStorage());
  sl.registerLazySingleton<AppSecureStorage>(() => AppSecureStorage());

  //! Features - Splash
  sl.registerFactory(() => SplashBloc(secureStorage: sl()));

  //! Features - Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(loginUser: sl(), logoutUser: sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(appStore: sl(), remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  //! Features - Dashboard
  sl.registerFactory(() => DashboardBloc(getDashboardData: sl()));
  sl.registerLazySingleton(() => GetDashboardData(sl()));
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(),
  );

  // Feature - Fund Transaction
  sl.registerFactory(
    () => WithdrawalBloc(getWithdrawalInfo: sl(), withdrawFunds: sl()),
  );
  sl.registerFactory(() => DepositBloc(depositFunds: sl(), verifyOtp: sl()));
  sl.registerFactory(() => FundDetailsBloc(getFundDetails: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetWithdrawalInfo(sl()));
  sl.registerLazySingleton(() => WithdrawFunds(sl()));
  sl.registerLazySingleton(() => DepositFunds(sl()));
  sl.registerLazySingleton(() => VerifyOtp(sl()));
  sl.registerLazySingleton(() => GetFundDetails(sl()));

  // Repositories
  sl.registerLazySingleton<FundTransactionRepository>(
    () => FundTransactionRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<FundDetailsRepository>(
    () => FundDetailsRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<FundTransactionRemoteDataSource>(
    () => FundTransactionRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<FundDetailsRemoteDataSource>(
    () => FundDetailsRemoteDataSourceImpl(),
  );

  //! Features - Transaction History
  sl.registerFactory(() => TransactionHistoryBloc(getTransactionHistory: sl()));
  sl.registerLazySingleton(() => GetTransactionHistory(sl()));
  sl.registerLazySingleton<TransactionHistoryRepository>(
    () => TransactionHistoryRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<TransactionHistoryRemoteDataSource>(
    () => TransactionHistoryRemoteDataSourceImpl(),
  );

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerFactory(() => FToast());
}
