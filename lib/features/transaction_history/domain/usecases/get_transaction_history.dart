import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/transaction_history.dart';
import '../repositories/transaction_history_repository.dart';

class GetTransactionHistory {
  final TransactionHistoryRepository repository;

  GetTransactionHistory(this.repository);

  Future<Either<Failure, TransactionHistory>> call({int page = 1}) async {
    return await repository.getTransactionHistory(page: page);
  }
}
