// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdrawal_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WithdrawalInfoModel {

 double get availableBalance; double get dailyLimit; List<LinkedAccountModel> get linkedAccounts;
/// Create a copy of WithdrawalInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawalInfoModelCopyWith<WithdrawalInfoModel> get copyWith => _$WithdrawalInfoModelCopyWithImpl<WithdrawalInfoModel>(this as WithdrawalInfoModel, _$identity);

  /// Serializes this WithdrawalInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawalInfoModel&&super == other&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&const DeepCollectionEquality().equals(other.linkedAccounts, linkedAccounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,availableBalance,dailyLimit,const DeepCollectionEquality().hash(linkedAccounts));



}

/// @nodoc
abstract mixin class $WithdrawalInfoModelCopyWith<$Res>  {
  factory $WithdrawalInfoModelCopyWith(WithdrawalInfoModel value, $Res Function(WithdrawalInfoModel) _then) = _$WithdrawalInfoModelCopyWithImpl;
@useResult
$Res call({
 double availableBalance, double dailyLimit, List<LinkedAccountModel> linkedAccounts
});




}
/// @nodoc
class _$WithdrawalInfoModelCopyWithImpl<$Res>
    implements $WithdrawalInfoModelCopyWith<$Res> {
  _$WithdrawalInfoModelCopyWithImpl(this._self, this._then);

  final WithdrawalInfoModel _self;
  final $Res Function(WithdrawalInfoModel) _then;

/// Create a copy of WithdrawalInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableBalance = null,Object? dailyLimit = null,Object? linkedAccounts = null,}) {
  return _then(_self.copyWith(
availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,linkedAccounts: null == linkedAccounts ? _self.linkedAccounts : linkedAccounts // ignore: cast_nullable_to_non_nullable
as List<LinkedAccountModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawalInfoModel].
extension WithdrawalInfoModelPatterns on WithdrawalInfoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawalInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawalInfoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawalInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawalInfoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawalInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawalInfoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double availableBalance,  double dailyLimit,  List<LinkedAccountModel> linkedAccounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawalInfoModel() when $default != null:
return $default(_that.availableBalance,_that.dailyLimit,_that.linkedAccounts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double availableBalance,  double dailyLimit,  List<LinkedAccountModel> linkedAccounts)  $default,) {final _that = this;
switch (_that) {
case _WithdrawalInfoModel():
return $default(_that.availableBalance,_that.dailyLimit,_that.linkedAccounts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double availableBalance,  double dailyLimit,  List<LinkedAccountModel> linkedAccounts)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawalInfoModel() when $default != null:
return $default(_that.availableBalance,_that.dailyLimit,_that.linkedAccounts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawalInfoModel extends WithdrawalInfoModel {
  const _WithdrawalInfoModel({this.availableBalance = 0.0, this.dailyLimit = 0.0, final  List<LinkedAccountModel> linkedAccounts = const []}): _linkedAccounts = linkedAccounts,super._();
  factory _WithdrawalInfoModel.fromJson(Map<String, dynamic> json) => _$WithdrawalInfoModelFromJson(json);

@override@JsonKey() final  double availableBalance;
@override@JsonKey() final  double dailyLimit;
 final  List<LinkedAccountModel> _linkedAccounts;
@override@JsonKey() List<LinkedAccountModel> get linkedAccounts {
  if (_linkedAccounts is EqualUnmodifiableListView) return _linkedAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linkedAccounts);
}


/// Create a copy of WithdrawalInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawalInfoModelCopyWith<_WithdrawalInfoModel> get copyWith => __$WithdrawalInfoModelCopyWithImpl<_WithdrawalInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawalInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawalInfoModel&&super == other&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.dailyLimit, dailyLimit) || other.dailyLimit == dailyLimit)&&const DeepCollectionEquality().equals(other._linkedAccounts, _linkedAccounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,availableBalance,dailyLimit,const DeepCollectionEquality().hash(_linkedAccounts));



}

/// @nodoc
abstract mixin class _$WithdrawalInfoModelCopyWith<$Res> implements $WithdrawalInfoModelCopyWith<$Res> {
  factory _$WithdrawalInfoModelCopyWith(_WithdrawalInfoModel value, $Res Function(_WithdrawalInfoModel) _then) = __$WithdrawalInfoModelCopyWithImpl;
@override @useResult
$Res call({
 double availableBalance, double dailyLimit, List<LinkedAccountModel> linkedAccounts
});




}
/// @nodoc
class __$WithdrawalInfoModelCopyWithImpl<$Res>
    implements _$WithdrawalInfoModelCopyWith<$Res> {
  __$WithdrawalInfoModelCopyWithImpl(this._self, this._then);

  final _WithdrawalInfoModel _self;
  final $Res Function(_WithdrawalInfoModel) _then;

/// Create a copy of WithdrawalInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableBalance = null,Object? dailyLimit = null,Object? linkedAccounts = null,}) {
  return _then(_WithdrawalInfoModel(
availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,dailyLimit: null == dailyLimit ? _self.dailyLimit : dailyLimit // ignore: cast_nullable_to_non_nullable
as double,linkedAccounts: null == linkedAccounts ? _self._linkedAccounts : linkedAccounts // ignore: cast_nullable_to_non_nullable
as List<LinkedAccountModel>,
  ));
}


}


/// @nodoc
mixin _$LinkedAccountModel {

 String get id; String get name; String get accountNumber;
/// Create a copy of LinkedAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkedAccountModelCopyWith<LinkedAccountModel> get copyWith => _$LinkedAccountModelCopyWithImpl<LinkedAccountModel>(this as LinkedAccountModel, _$identity);

  /// Serializes this LinkedAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkedAccountModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,name,accountNumber);



}

/// @nodoc
abstract mixin class $LinkedAccountModelCopyWith<$Res>  {
  factory $LinkedAccountModelCopyWith(LinkedAccountModel value, $Res Function(LinkedAccountModel) _then) = _$LinkedAccountModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String accountNumber
});




}
/// @nodoc
class _$LinkedAccountModelCopyWithImpl<$Res>
    implements $LinkedAccountModelCopyWith<$Res> {
  _$LinkedAccountModelCopyWithImpl(this._self, this._then);

  final LinkedAccountModel _self;
  final $Res Function(LinkedAccountModel) _then;

/// Create a copy of LinkedAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? accountNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LinkedAccountModel].
extension LinkedAccountModelPatterns on LinkedAccountModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinkedAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinkedAccountModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinkedAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _LinkedAccountModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinkedAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _LinkedAccountModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String accountNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinkedAccountModel() when $default != null:
return $default(_that.id,_that.name,_that.accountNumber);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String accountNumber)  $default,) {final _that = this;
switch (_that) {
case _LinkedAccountModel():
return $default(_that.id,_that.name,_that.accountNumber);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String accountNumber)?  $default,) {final _that = this;
switch (_that) {
case _LinkedAccountModel() when $default != null:
return $default(_that.id,_that.name,_that.accountNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LinkedAccountModel extends LinkedAccountModel {
  const _LinkedAccountModel({this.id = '', this.name = '', this.accountNumber = ''}): super._();
  factory _LinkedAccountModel.fromJson(Map<String, dynamic> json) => _$LinkedAccountModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String accountNumber;

/// Create a copy of LinkedAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkedAccountModelCopyWith<_LinkedAccountModel> get copyWith => __$LinkedAccountModelCopyWithImpl<_LinkedAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkedAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkedAccountModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,name,accountNumber);



}

/// @nodoc
abstract mixin class _$LinkedAccountModelCopyWith<$Res> implements $LinkedAccountModelCopyWith<$Res> {
  factory _$LinkedAccountModelCopyWith(_LinkedAccountModel value, $Res Function(_LinkedAccountModel) _then) = __$LinkedAccountModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String accountNumber
});




}
/// @nodoc
class __$LinkedAccountModelCopyWithImpl<$Res>
    implements _$LinkedAccountModelCopyWith<$Res> {
  __$LinkedAccountModelCopyWithImpl(this._self, this._then);

  final _LinkedAccountModel _self;
  final $Res Function(_LinkedAccountModel) _then;

/// Create a copy of LinkedAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? accountNumber = null,}) {
  return _then(_LinkedAccountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
