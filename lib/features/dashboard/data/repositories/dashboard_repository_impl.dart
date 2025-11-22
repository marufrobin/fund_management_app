import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteData = await remoteDataSource.getDashboardData();
      return Right(remoteData.toEntity());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  // else {
  //   // Ideally check local cache here, but for now return CacheFailure or similar
  //   // Since we don't have cache implemented yet, we'll return a ServerFailure or a specific NetworkFailure
  //   return Left(ServerFailure());
  // }
  // }
}
