import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/fund_details.dart';

abstract class FundDetailsRepository {
  Future<Either<Failure, FundDetails>> getFundDetails(String timePeriod);
}
