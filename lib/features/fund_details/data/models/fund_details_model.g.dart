// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FundDetailsModel _$FundDetailsModelFromJson(Map<String, dynamic> json) =>
    _FundDetailsModel(
      totalInvestment: (json['totalInvestment'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercentage: (json['profitPercentage'] as num).toDouble(),
      chartData: (json['chartData'] as List<dynamic>)
          .map((e) => FundHistoryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FundDetailsModelToJson(_FundDetailsModel instance) =>
    <String, dynamic>{
      'totalInvestment': instance.totalInvestment,
      'currentValue': instance.currentValue,
      'profit': instance.profit,
      'profitPercentage': instance.profitPercentage,
      'chartData': instance.chartData,
    };

_FundHistoryItemModel _$FundHistoryItemModelFromJson(
  Map<String, dynamic> json,
) => _FundHistoryItemModel(
  date: DateTime.parse(json['date'] as String),
  value: (json['value'] as num).toDouble(),
);

Map<String, dynamic> _$FundHistoryItemModelToJson(
  _FundHistoryItemModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'value': instance.value,
};
