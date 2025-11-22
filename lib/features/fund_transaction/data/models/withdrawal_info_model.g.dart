// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WithdrawalInfoModel _$WithdrawalInfoModelFromJson(Map<String, dynamic> json) =>
    _WithdrawalInfoModel(
      availableBalance: (json['availableBalance'] as num?)?.toDouble() ?? 0.0,
      dailyLimit: (json['dailyLimit'] as num?)?.toDouble() ?? 0.0,
      linkedAccounts:
          (json['linkedAccounts'] as List<dynamic>?)
              ?.map(
                (e) => LinkedAccountModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WithdrawalInfoModelToJson(
  _WithdrawalInfoModel instance,
) => <String, dynamic>{
  'availableBalance': instance.availableBalance,
  'dailyLimit': instance.dailyLimit,
  'linkedAccounts': instance.linkedAccounts,
};

_LinkedAccountModel _$LinkedAccountModelFromJson(Map<String, dynamic> json) =>
    _LinkedAccountModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      accountNumber: json['accountNumber'] as String? ?? '',
    );

Map<String, dynamic> _$LinkedAccountModelToJson(_LinkedAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountNumber': instance.accountNumber,
    };
