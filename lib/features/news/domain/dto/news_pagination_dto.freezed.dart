// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_pagination_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsPaginationDto {

 List<NewsDto> get items; int get page; bool get hasMore; int get total;
/// Create a copy of NewsPaginationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsPaginationDtoCopyWith<NewsPaginationDto> get copyWith => _$NewsPaginationDtoCopyWithImpl<NewsPaginationDto>(this as NewsPaginationDto, _$identity);

  /// Serializes this NewsPaginationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NewsPaginationDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsPaginationDto&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NewsPaginationDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.page,_this.hasMore,_this.total);
}

@override
String toString() {
  final _this = this as NewsPaginationDto;
  return 'NewsPaginationDto(items: ${_this.items}, page: ${_this.page}, hasMore: ${_this.hasMore}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $NewsPaginationDtoCopyWith<$Res>  {
  factory $NewsPaginationDtoCopyWith(NewsPaginationDto value, $Res Function(NewsPaginationDto) _then) = _$NewsPaginationDtoCopyWithImpl;
@useResult
$Res call({
 List<NewsDto> items, int page, bool hasMore, int total
});




}
/// @nodoc
class _$NewsPaginationDtoCopyWithImpl<$Res>
    implements $NewsPaginationDtoCopyWith<$Res> {
  _$NewsPaginationDtoCopyWithImpl(this._self, this._then);

  final NewsPaginationDto _self;
  final $Res Function(NewsPaginationDto) _then;

/// Create a copy of NewsPaginationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? hasMore = null,Object? total = null,}) {
  return _then(NewsPaginationDto(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NewsDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsPaginationDto].
extension NewsPaginationDtoPatterns on NewsPaginationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsPaginationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsPaginationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsPaginationDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsPaginationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsPaginationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsPaginationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NewsDto> items,  int page,  bool hasMore,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsPaginationDto() when $default != null:
return $default(_that.items,_that.page,_that.hasMore,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NewsDto> items,  int page,  bool hasMore,  int total)  $default,) {final _that = this;
switch (_that) {
case _NewsPaginationDto():
return $default(_that.items,_that.page,_that.hasMore,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NewsDto> items,  int page,  bool hasMore,  int total)?  $default,) {final _that = this;
switch (_that) {
case _NewsPaginationDto() when $default != null:
return $default(_that.items,_that.page,_that.hasMore,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsPaginationDto implements NewsPaginationDto {
   _NewsPaginationDto({required  List<NewsDto> items, this.page = 1, this.hasMore = false, this.total = 0}): _items = items;
  factory _NewsPaginationDto.fromJson(Map<String, dynamic> json) => _$NewsPaginationDtoFromJson(json);

 final  List<NewsDto> _items;
@override List<NewsDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  int total;

/// Create a copy of NewsPaginationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsPaginationDtoCopyWith<_NewsPaginationDto> get copyWith => __$NewsPaginationDtoCopyWithImpl<_NewsPaginationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsPaginationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsPaginationDto&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,hasMore,total);
}

@override
String toString() {
    return 'NewsPaginationDto(items: $items, page: $page, hasMore: $hasMore, total: $total)';
}


}

/// @nodoc
abstract mixin class _$NewsPaginationDtoCopyWith<$Res> implements $NewsPaginationDtoCopyWith<$Res> {
  factory _$NewsPaginationDtoCopyWith(_NewsPaginationDto value, $Res Function(_NewsPaginationDto) _then) = __$NewsPaginationDtoCopyWithImpl;
@override @useResult
$Res call({
 List<NewsDto> items, int page, bool hasMore, int total
});




}
/// @nodoc
class __$NewsPaginationDtoCopyWithImpl<$Res>
    implements _$NewsPaginationDtoCopyWith<$Res> {
  __$NewsPaginationDtoCopyWithImpl(this._self, this._then);

  final _NewsPaginationDto _self;
  final $Res Function(_NewsPaginationDto) _then;

/// Create a copy of NewsPaginationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? hasMore = null,Object? total = null,}) {
  return _then(_NewsPaginationDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NewsDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
