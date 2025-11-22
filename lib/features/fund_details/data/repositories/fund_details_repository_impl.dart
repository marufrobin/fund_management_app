import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/fund_details.dart';
import '../../domain/repositories/fund_details_repository.dart';
import '../datasources/fund_details_remote_data_source.dart';

class FundDetailsRepositoryImpl implements FundDetailsRepository {
  final FundDetailsRemoteDataSource remoteDataSource;

  FundDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FundDetails>> getFundDetails(String timePeriod) async {
    try {
      final result = await remoteDataSource.getFundDetails(timePeriod);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
