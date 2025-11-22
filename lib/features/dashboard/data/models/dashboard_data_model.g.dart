// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardDataModel _$DashboardDataModelFromJson(Map<String, dynamic> json) =>
    _DashboardDataModel(
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      availableBalance: (json['availableBalance'] as num?)?.toDouble(),
      recentTransactions: (json['recentTransactions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TransactionModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$DashboardDataModelToJson(_DashboardDataModel instance) =>
    <String, dynamic>{
      'currentBalance': instance.currentBalance,
      'availableBalance': instance.availableBalance,
      'recentTransactions': instance.recentTransactions,
    };

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
      isIncome: json['isIncome'] as bool?,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'date': instance.date?.toIso8601String(),
      'isIncome': instance.isIncome,
    };
