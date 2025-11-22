import 'package:dartz/dartz.dart';
import 'package:fund_management_app/core/constants/app_storage_key.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/storage/app_store_contract.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppStoreContract appStore;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.appStore, required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      final user = userModel.toEntity();

      /// Store token and user info
      await appStore.set(key: AppStorageKey.accessToken, value: user.token);
      await appStore.set(key: AppStorageKey.userId, value: user.id);
      await appStore.set(key: AppStorageKey.userEmail, value: user.email);
      await appStore.set(key: AppStorageKey.userName, value: user.name);

      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      /// Clear all stored user data
      await appStore.destroyAll();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
