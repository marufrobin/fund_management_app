import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/transaction_history.dart';

abstract class TransactionHistoryRepository {
  Future<Either<Failure, TransactionHistory>> getTransactionHistory({
    int page = 1,
  });
}
