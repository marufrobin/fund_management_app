import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/transaction_history.dart';
import '../../domain/repositories/transaction_history_repository.dart';
import '../datasources/transaction_history_remote_data_source.dart';

class TransactionHistoryRepositoryImpl
    implements TransactionHistoryRepository {
  final TransactionHistoryRemoteDataSource remoteDataSource;

  TransactionHistoryRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, TransactionHistory>> getTransactionHistory({
    int page = 1,
  }) async {
    try {
      final result = await remoteDataSource.getTransactionHistory(page: page);
      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
