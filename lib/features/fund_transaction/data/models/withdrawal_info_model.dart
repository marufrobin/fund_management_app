import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/withdrawal_info.dart';

part 'withdrawal_info_model.freezed.dart';
part 'withdrawal_info_model.g.dart';

@freezed
abstract class WithdrawalInfoModel
    with _$WithdrawalInfoModel
    implements WithdrawalInfo {
  const WithdrawalInfoModel._();

  const factory WithdrawalInfoModel({
    @Default(0.0) double availableBalance,
    @Default(0.0) double dailyLimit,
    @Default([]) List<LinkedAccountModel> linkedAccounts,
  }) = _WithdrawalInfoModel;

  factory WithdrawalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalInfoModelFromJson(json);

  @override
  List<Object?> get props => [availableBalance, dailyLimit, linkedAccounts];

  @override
  bool? get stringify => true;
}

@freezed
abstract class LinkedAccountModel
    with _$LinkedAccountModel
    implements LinkedAccount {
  const LinkedAccountModel._();

  const factory LinkedAccountModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String accountNumber,
  }) = _LinkedAccountModel;

  factory LinkedAccountModel.fromJson(Map<String, dynamic> json) =>
      _$LinkedAccountModelFromJson(json);

  @override
  List<Object?> get props => [id, name, accountNumber];

  @override
  bool? get stringify => true;
}
