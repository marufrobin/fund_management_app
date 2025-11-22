// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FundDetailsModel {

 double get totalInvestment; double get currentValue; double get profit; double get profitPercentage; List<FundHistoryItemModel> get chartData;
/// Create a copy of FundDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundDetailsModelCopyWith<FundDetailsModel> get copyWith => _$FundDetailsModelCopyWithImpl<FundDetailsModel>(this as FundDetailsModel, _$identity);

  /// Serializes this FundDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundDetailsModel&&super == other&&(identical(other.totalInvestment, totalInvestment) || other.totalInvestment == totalInvestment)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.profitPercentage, profitPercentage) || other.profitPercentage == profitPercentage)&&const DeepCollectionEquality().equals(other.chartData, chartData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,totalInvestment,currentValue,profit,profitPercentage,const DeepCollectionEquality().hash(chartData));



}

/// @nodoc
abstract mixin class $FundDetailsModelCopyWith<$Res>  {
  factory $FundDetailsModelCopyWith(FundDetailsModel value, $Res Function(FundDetailsModel) _then) = _$FundDetailsModelCopyWithImpl;
@useResult
$Res call({
 double totalInvestment, double currentValue, double profit, double profitPercentage, List<FundHistoryItemModel> chartData
});




}
/// @nodoc
class _$FundDetailsModelCopyWithImpl<$Res>
    implements $FundDetailsModelCopyWith<$Res> {
  _$FundDetailsModelCopyWithImpl(this._self, this._then);

  final FundDetailsModel _self;
  final $Res Function(FundDetailsModel) _then;

/// Create a copy of FundDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalInvestment = null,Object? currentValue = null,Object? profit = null,Object? profitPercentage = null,Object? chartData = null,}) {
  return _then(_self.copyWith(
totalInvestment: null == totalInvestment ? _self.totalInvestment : totalInvestment // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,profitPercentage: null == profitPercentage ? _self.profitPercentage : profitPercentage // ignore: cast_nullable_to_non_nullable
as double,chartData: null == chartData ? _self.chartData : chartData // ignore: cast_nullable_to_non_nullable
as List<FundHistoryItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FundDetailsModel].
extension FundDetailsModelPatterns on FundDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FundDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FundDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FundDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _FundDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FundDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FundDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalInvestment,  double currentValue,  double profit,  double profitPercentage,  List<FundHistoryItemModel> chartData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FundDetailsModel() when $default != null:
return $default(_that.totalInvestment,_that.currentValue,_that.profit,_that.profitPercentage,_that.chartData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalInvestment,  double currentValue,  double profit,  double profitPercentage,  List<FundHistoryItemModel> chartData)  $default,) {final _that = this;
switch (_that) {
case _FundDetailsModel():
return $default(_that.totalInvestment,_that.currentValue,_that.profit,_that.profitPercentage,_that.chartData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalInvestment,  double currentValue,  double profit,  double profitPercentage,  List<FundHistoryItemModel> chartData)?  $default,) {final _that = this;
switch (_that) {
case _FundDetailsModel() when $default != null:
return $default(_that.totalInvestment,_that.currentValue,_that.profit,_that.profitPercentage,_that.chartData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FundDetailsModel implements FundDetailsModel {
  const _FundDetailsModel({required this.totalInvestment, required this.currentValue, required this.profit, required this.profitPercentage, required final  List<FundHistoryItemModel> chartData}): _chartData = chartData;
  factory _FundDetailsModel.fromJson(Map<String, dynamic> json) => _$FundDetailsModelFromJson(json);

@override final  double totalInvestment;
@override final  double currentValue;
@override final  double profit;
@override final  double profitPercentage;
 final  List<FundHistoryItemModel> _chartData;
@override List<FundHistoryItemModel> get chartData {
  if (_chartData is EqualUnmodifiableListView) return _chartData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chartData);
}


/// Create a copy of FundDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundDetailsModelCopyWith<_FundDetailsModel> get copyWith => __$FundDetailsModelCopyWithImpl<_FundDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FundDetailsModel&&super == other&&(identical(other.totalInvestment, totalInvestment) || other.totalInvestment == totalInvestment)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.profit, profit) || other.profit == profit)&&(identical(other.profitPercentage, profitPercentage) || other.profitPercentage == profitPercentage)&&const DeepCollectionEquality().equals(other._chartData, _chartData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,totalInvestment,currentValue,profit,profitPercentage,const DeepCollectionEquality().hash(_chartData));



}

/// @nodoc
abstract mixin class _$FundDetailsModelCopyWith<$Res> implements $FundDetailsModelCopyWith<$Res> {
  factory _$FundDetailsModelCopyWith(_FundDetailsModel value, $Res Function(_FundDetailsModel) _then) = __$FundDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 double totalInvestment, double currentValue, double profit, double profitPercentage, List<FundHistoryItemModel> chartData
});




}
/// @nodoc
class __$FundDetailsModelCopyWithImpl<$Res>
    implements _$FundDetailsModelCopyWith<$Res> {
  __$FundDetailsModelCopyWithImpl(this._self, this._then);

  final _FundDetailsModel _self;
  final $Res Function(_FundDetailsModel) _then;

/// Create a copy of FundDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalInvestment = null,Object? currentValue = null,Object? profit = null,Object? profitPercentage = null,Object? chartData = null,}) {
  return _then(_FundDetailsModel(
totalInvestment: null == totalInvestment ? _self.totalInvestment : totalInvestment // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,profitPercentage: null == profitPercentage ? _self.profitPercentage : profitPercentage // ignore: cast_nullable_to_non_nullable
as double,chartData: null == chartData ? _self._chartData : chartData // ignore: cast_nullable_to_non_nullable
as List<FundHistoryItemModel>,
  ));
}


}


/// @nodoc
mixin _$FundHistoryItemModel {

 DateTime get date; double get value;
/// Create a copy of FundHistoryItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundHistoryItemModelCopyWith<FundHistoryItemModel> get copyWith => _$FundHistoryItemModelCopyWithImpl<FundHistoryItemModel>(this as FundHistoryItemModel, _$identity);

  /// Serializes this FundHistoryItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundHistoryItemModel&&super == other&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,date,value);



}

/// @nodoc
abstract mixin class $FundHistoryItemModelCopyWith<$Res>  {
  factory $FundHistoryItemModelCopyWith(FundHistoryItemModel value, $Res Function(FundHistoryItemModel) _then) = _$FundHistoryItemModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, double value
});




}
/// @nodoc
class _$FundHistoryItemModelCopyWithImpl<$Res>
    implements $FundHistoryItemModelCopyWith<$Res> {
  _$FundHistoryItemModelCopyWithImpl(this._self, this._then);

  final FundHistoryItemModel _self;
  final $Res Function(FundHistoryItemModel) _then;

/// Create a copy of FundHistoryItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? value = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FundHistoryItemModel].
extension FundHistoryItemModelPatterns on FundHistoryItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FundHistoryItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FundHistoryItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FundHistoryItemModel value)  $default,){
final _that = this;
switch (_that) {
case _FundHistoryItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FundHistoryItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _FundHistoryItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FundHistoryItemModel() when $default != null:
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double value)  $default,) {final _that = this;
switch (_that) {
case _FundHistoryItemModel():
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double value)?  $default,) {final _that = this;
switch (_that) {
case _FundHistoryItemModel() when $default != null:
return $default(_that.date,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FundHistoryItemModel implements FundHistoryItemModel {
  const _FundHistoryItemModel({required this.date, required this.value});
  factory _FundHistoryItemModel.fromJson(Map<String, dynamic> json) => _$FundHistoryItemModelFromJson(json);

@override final  DateTime date;
@override final  double value;

/// Create a copy of FundHistoryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundHistoryItemModelCopyWith<_FundHistoryItemModel> get copyWith => __$FundHistoryItemModelCopyWithImpl<_FundHistoryItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundHistoryItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FundHistoryItemModel&&super == other&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,date,value);



}

/// @nodoc
abstract mixin class _$FundHistoryItemModelCopyWith<$Res> implements $FundHistoryItemModelCopyWith<$Res> {
  factory _$FundHistoryItemModelCopyWith(_FundHistoryItemModel value, $Res Function(_FundHistoryItemModel) _then) = __$FundHistoryItemModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double value
});




}
/// @nodoc
class __$FundHistoryItemModelCopyWithImpl<$Res>
    implements _$FundHistoryItemModelCopyWith<$Res> {
  __$FundHistoryItemModelCopyWithImpl(this._self, this._then);

  final _FundHistoryItemModel _self;
  final $Res Function(_FundHistoryItemModel) _then;

/// Create a copy of FundHistoryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? value = null,}) {
  return _then(_FundHistoryItemModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
