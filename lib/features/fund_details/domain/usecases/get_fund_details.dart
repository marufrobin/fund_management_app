import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/fund_details.dart';
import '../repositories/fund_details_repository.dart';

class GetFundDetails implements UseCase<FundDetails, GetFundDetailsParams> {
  final FundDetailsRepository repository;

  GetFundDetails(this.repository);

  @override
  Future<Either<Failure, FundDetails>> call(GetFundDetailsParams params) async {
    return await repository.getFundDetails(params.timePeriod);
  }
}

class GetFundDetailsParams extends Equatable {
  final String timePeriod;

  const GetFundDetailsParams({required this.timePeriod});

  @override
  List<Object?> get props => [timePeriod];
}
