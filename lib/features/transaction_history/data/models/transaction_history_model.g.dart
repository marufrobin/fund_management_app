// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionHistoryModel _$TransactionHistoryModelFromJson(
  Map<String, dynamic> json,
) => _TransactionHistoryModel(
  groups: (json['groups'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TransactionGroupModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TransactionHistoryModelToJson(
  _TransactionHistoryModel instance,
) => <String, dynamic>{'groups': instance.groups};

_TransactionGroupModel _$TransactionGroupModelFromJson(
  Map<String, dynamic> json,
) => _TransactionGroupModel(
  title: json['title'] as String?,
  transactions: (json['transactions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : TransactionItemModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$TransactionGroupModelToJson(
  _TransactionGroupModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'transactions': instance.transactions,
};

_TransactionItemModel _$TransactionItemModelFromJson(
  Map<String, dynamic> json,
) => _TransactionItemModel(
  id: json['id'] as String?,
  type: json['type'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  time: json['time'] as String?,
  status: json['status'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$TransactionItemModelToJson(
  _TransactionItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'amount': instance.amount,
  'time': instance.time,
  'status': instance.status,
  'date': instance.date?.toIso8601String(),
};
