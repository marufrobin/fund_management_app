import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transaction_history.dart';

part 'transaction_history_model.freezed.dart';
part 'transaction_history_model.g.dart';

@freezed
abstract class TransactionHistoryModel with _$TransactionHistoryModel {
  const factory TransactionHistoryModel({
    required List<TransactionGroupModel?>? groups,
  }) = _TransactionHistoryModel;

  const TransactionHistoryModel._();

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);

  TransactionHistory toEntity() => TransactionHistory(
        groups: groups
                ?.whereType<TransactionGroupModel>()
                .map((e) => e.toEntity())
                .toList() ??
            [],
      );
}

@freezed
abstract class TransactionGroupModel with _$TransactionGroupModel {
  const factory TransactionGroupModel({
    required String? title,
    required List<TransactionItemModel?>? transactions,
  }) = _TransactionGroupModel;

  const TransactionGroupModel._();

  factory TransactionGroupModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionGroupModelFromJson(json);

  TransactionGroup toEntity() => TransactionGroup(
        title: title ?? '',
        transactions: transactions
                ?.whereType<TransactionItemModel>()
                .map((e) => e.toEntity())
                .toList() ??
            [],
      );
}

@freezed
abstract class TransactionItemModel with _$TransactionItemModel {
  const factory TransactionItemModel({
    required String? id,
    required String? type,
    required double? amount,
    required String? time,
    required String? status,
    required DateTime? date,
  }) = _TransactionItemModel;

  const TransactionItemModel._();

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemModelFromJson(json);

  TransactionItem toEntity() => TransactionItem(
        id: id ?? '',
        type: _parseTransactionType(type),
        amount: amount ?? 0.0,
        time: time ?? '',
        status: _parseTransactionStatus(status),
        date: date ?? DateTime.now(),
      );

  static TransactionType _parseTransactionType(String? type) {
    switch (type?.toLowerCase()) {
      case 'deposit':
        return TransactionType.deposit;
      case 'withdraw':
        return TransactionType.withdraw;
      case 'transfer':
        return TransactionType.transfer;
      default:
        return TransactionType.deposit;
    }
  }

  static TransactionStatus _parseTransactionStatus(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
        return TransactionStatus.completed;
      case 'pending':
        return TransactionStatus.pending;
      default:
        return TransactionStatus.completed;
    }
  }
}
