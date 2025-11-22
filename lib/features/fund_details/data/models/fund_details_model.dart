import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/fund_details.dart';

part 'fund_details_model.freezed.dart';
part 'fund_details_model.g.dart';

@freezed
abstract class FundDetailsModel with _$FundDetailsModel implements FundDetails {
  const factory FundDetailsModel({
    required double totalInvestment,
    required double currentValue,
    required double profit,
    required double profitPercentage,
    required List<FundHistoryItemModel> chartData,
  }) = _FundDetailsModel;

  factory FundDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FundDetailsModelFromJson(json);
}

@freezed
abstract class FundHistoryItemModel
    with _$FundHistoryItemModel
    implements FundHistoryItem {
  const factory FundHistoryItemModel({
    required DateTime date,
    required double value,
  }) = _FundHistoryItemModel;

  factory FundHistoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$FundHistoryItemModelFromJson(json);
}
