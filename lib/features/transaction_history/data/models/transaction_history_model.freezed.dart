// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionHistoryModel {

 List<TransactionGroupModel?>? get groups;
/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionHistoryModelCopyWith<TransactionHistoryModel> get copyWith => _$TransactionHistoryModelCopyWithImpl<TransactionHistoryModel>(this as TransactionHistoryModel, _$identity);

  /// Serializes this TransactionHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionHistoryModel&&const DeepCollectionEquality().equals(other.groups, groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(groups));

@override
String toString() {
  return 'TransactionHistoryModel(groups: $groups)';
}


}

/// @nodoc
abstract mixin class $TransactionHistoryModelCopyWith<$Res>  {
  factory $TransactionHistoryModelCopyWith(TransactionHistoryModel value, $Res Function(TransactionHistoryModel) _then) = _$TransactionHistoryModelCopyWithImpl;
@useResult
$Res call({
 List<TransactionGroupModel?>? groups
});




}
/// @nodoc
class _$TransactionHistoryModelCopyWithImpl<$Res>
    implements $TransactionHistoryModelCopyWith<$Res> {
  _$TransactionHistoryModelCopyWithImpl(this._self, this._then);

  final TransactionHistoryModel _self;
  final $Res Function(TransactionHistoryModel) _then;

/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groups = freezed,}) {
  return _then(_self.copyWith(
groups: freezed == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<TransactionGroupModel?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionHistoryModel].
extension TransactionHistoryModelPatterns on TransactionHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TransactionGroupModel?>? groups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
return $default(_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TransactionGroupModel?>? groups)  $default,) {final _that = this;
switch (_that) {
case _TransactionHistoryModel():
return $default(_that.groups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TransactionGroupModel?>? groups)?  $default,) {final _that = this;
switch (_that) {
case _TransactionHistoryModel() when $default != null:
return $default(_that.groups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionHistoryModel extends TransactionHistoryModel {
  const _TransactionHistoryModel({required final  List<TransactionGroupModel?>? groups}): _groups = groups,super._();
  factory _TransactionHistoryModel.fromJson(Map<String, dynamic> json) => _$TransactionHistoryModelFromJson(json);

 final  List<TransactionGroupModel?>? _groups;
@override List<TransactionGroupModel?>? get groups {
  final value = _groups;
  if (value == null) return null;
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionHistoryModelCopyWith<_TransactionHistoryModel> get copyWith => __$TransactionHistoryModelCopyWithImpl<_TransactionHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionHistoryModel&&const DeepCollectionEquality().equals(other._groups, _groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_groups));

@override
String toString() {
  return 'TransactionHistoryModel(groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$TransactionHistoryModelCopyWith<$Res> implements $TransactionHistoryModelCopyWith<$Res> {
  factory _$TransactionHistoryModelCopyWith(_TransactionHistoryModel value, $Res Function(_TransactionHistoryModel) _then) = __$TransactionHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionGroupModel?>? groups
});




}
/// @nodoc
class __$TransactionHistoryModelCopyWithImpl<$Res>
    implements _$TransactionHistoryModelCopyWith<$Res> {
  __$TransactionHistoryModelCopyWithImpl(this._self, this._then);

  final _TransactionHistoryModel _self;
  final $Res Function(_TransactionHistoryModel) _then;

/// Create a copy of TransactionHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groups = freezed,}) {
  return _then(_TransactionHistoryModel(
groups: freezed == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<TransactionGroupModel?>?,
  ));
}


}


/// @nodoc
mixin _$TransactionGroupModel {

 String? get title; List<TransactionItemModel?>? get transactions;
/// Create a copy of TransactionGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionGroupModelCopyWith<TransactionGroupModel> get copyWith => _$TransactionGroupModelCopyWithImpl<TransactionGroupModel>(this as TransactionGroupModel, _$identity);

  /// Serializes this TransactionGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionGroupModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'TransactionGroupModel(title: $title, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $TransactionGroupModelCopyWith<$Res>  {
  factory $TransactionGroupModelCopyWith(TransactionGroupModel value, $Res Function(TransactionGroupModel) _then) = _$TransactionGroupModelCopyWithImpl;
@useResult
$Res call({
 String? title, List<TransactionItemModel?>? transactions
});




}
/// @nodoc
class _$TransactionGroupModelCopyWithImpl<$Res>
    implements $TransactionGroupModelCopyWith<$Res> {
  _$TransactionGroupModelCopyWithImpl(this._self, this._then);

  final TransactionGroupModel _self;
  final $Res Function(TransactionGroupModel) _then;

/// Create a copy of TransactionGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? transactions = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,transactions: freezed == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionGroupModel].
extension TransactionGroupModelPatterns on TransactionGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  List<TransactionItemModel?>? transactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionGroupModel() when $default != null:
return $default(_that.title,_that.transactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  List<TransactionItemModel?>? transactions)  $default,) {final _that = this;
switch (_that) {
case _TransactionGroupModel():
return $default(_that.title,_that.transactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  List<TransactionItemModel?>? transactions)?  $default,) {final _that = this;
switch (_that) {
case _TransactionGroupModel() when $default != null:
return $default(_that.title,_that.transactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionGroupModel extends TransactionGroupModel {
  const _TransactionGroupModel({required this.title, required final  List<TransactionItemModel?>? transactions}): _transactions = transactions,super._();
  factory _TransactionGroupModel.fromJson(Map<String, dynamic> json) => _$TransactionGroupModelFromJson(json);

@override final  String? title;
 final  List<TransactionItemModel?>? _transactions;
@override List<TransactionItemModel?>? get transactions {
  final value = _transactions;
  if (value == null) return null;
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TransactionGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionGroupModelCopyWith<_TransactionGroupModel> get copyWith => __$TransactionGroupModelCopyWithImpl<_TransactionGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionGroupModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'TransactionGroupModel(title: $title, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$TransactionGroupModelCopyWith<$Res> implements $TransactionGroupModelCopyWith<$Res> {
  factory _$TransactionGroupModelCopyWith(_TransactionGroupModel value, $Res Function(_TransactionGroupModel) _then) = __$TransactionGroupModelCopyWithImpl;
@override @useResult
$Res call({
 String? title, List<TransactionItemModel?>? transactions
});




}
/// @nodoc
class __$TransactionGroupModelCopyWithImpl<$Res>
    implements _$TransactionGroupModelCopyWith<$Res> {
  __$TransactionGroupModelCopyWithImpl(this._self, this._then);

  final _TransactionGroupModel _self;
  final $Res Function(_TransactionGroupModel) _then;

/// Create a copy of TransactionGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? transactions = freezed,}) {
  return _then(_TransactionGroupModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,transactions: freezed == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionItemModel?>?,
  ));
}


}


/// @nodoc
mixin _$TransactionItemModel {

 String? get id; String? get type; double? get amount; String? get time; String? get status; DateTime? get date;
/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemModelCopyWith<TransactionItemModel> get copyWith => _$TransactionItemModelCopyWithImpl<TransactionItemModel>(this as TransactionItemModel, _$identity);

  /// Serializes this TransactionItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,time,status,date);

@override
String toString() {
  return 'TransactionItemModel(id: $id, type: $type, amount: $amount, time: $time, status: $status, date: $date)';
}


}

/// @nodoc
abstract mixin class $TransactionItemModelCopyWith<$Res>  {
  factory $TransactionItemModelCopyWith(TransactionItemModel value, $Res Function(TransactionItemModel) _then) = _$TransactionItemModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? type, double? amount, String? time, String? status, DateTime? date
});




}
/// @nodoc
class _$TransactionItemModelCopyWithImpl<$Res>
    implements $TransactionItemModelCopyWith<$Res> {
  _$TransactionItemModelCopyWithImpl(this._self, this._then);

  final TransactionItemModel _self;
  final $Res Function(TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? amount = freezed,Object? time = freezed,Object? status = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemModel].
extension TransactionItemModelPatterns on TransactionItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? type,  double? amount,  String? time,  String? status,  DateTime? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.time,_that.status,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? type,  double? amount,  String? time,  String? status,  DateTime? date)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel():
return $default(_that.id,_that.type,_that.amount,_that.time,_that.status,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? type,  double? amount,  String? time,  String? status,  DateTime? date)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemModel() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.time,_that.status,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItemModel extends TransactionItemModel {
  const _TransactionItemModel({required this.id, required this.type, required this.amount, required this.time, required this.status, required this.date}): super._();
  factory _TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);

@override final  String? id;
@override final  String? type;
@override final  double? amount;
@override final  String? time;
@override final  String? status;
@override final  DateTime? date;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemModelCopyWith<_TransactionItemModel> get copyWith => __$TransactionItemModelCopyWithImpl<_TransactionItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,time,status,date);

@override
String toString() {
  return 'TransactionItemModel(id: $id, type: $type, amount: $amount, time: $time, status: $status, date: $date)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemModelCopyWith<$Res> implements $TransactionItemModelCopyWith<$Res> {
  factory _$TransactionItemModelCopyWith(_TransactionItemModel value, $Res Function(_TransactionItemModel) _then) = __$TransactionItemModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? type, double? amount, String? time, String? status, DateTime? date
});




}
/// @nodoc
class __$TransactionItemModelCopyWithImpl<$Res>
    implements _$TransactionItemModelCopyWith<$Res> {
  __$TransactionItemModelCopyWithImpl(this._self, this._then);

  final _TransactionItemModel _self;
  final $Res Function(_TransactionItemModel) _then;

/// Create a copy of TransactionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? amount = freezed,Object? time = freezed,Object? status = freezed,Object? date = freezed,}) {
  return _then(_TransactionItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
