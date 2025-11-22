import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/dashboard_data.dart';

part 'dashboard_data_model.freezed.dart';
part 'dashboard_data_model.g.dart';

@freezed
abstract class DashboardDataModel with _$DashboardDataModel {
  const factory DashboardDataModel({
    required double? currentBalance,
    required double? availableBalance,
    required List<TransactionModel?>? recentTransactions,
  }) = _DashboardDataModel;

  const DashboardDataModel._();

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataModelFromJson(json);

  DashboardData toEntity() => DashboardData(
        currentBalance: currentBalance ?? 0.0,
        availableBalance: availableBalance ?? 0.0,
        recentTransactions: recentTransactions
                ?.whereType<TransactionModel>()
                .map((e) => e.toEntity())
                .toList() ??
            [],
      );
}

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String? id,
    required String? title,
    required double? amount,
    required DateTime? date,
    required bool? isIncome,
  }) = _TransactionModel;

  const TransactionModel._();

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Transaction toEntity() => Transaction(
        id: id ?? '',
        title: title ?? '',
        amount: amount ?? 0.0,
        date: date ?? DateTime.now(),
        isIncome: isIncome ?? false,
      );
}
