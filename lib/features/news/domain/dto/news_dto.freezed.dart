// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsDto {

 int get id; String get title; String? get category; String? get sourceName; String? get imageUrl; String? get publishedAt; int get likes; int get comments; int get views;
/// Create a copy of NewsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsDtoCopyWith<NewsDto> get copyWith => _$NewsDtoCopyWithImpl<NewsDto>(this as NewsDto, _$identity);

  /// Serializes this NewsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NewsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.sourceName, _this.sourceName) || other.sourceName == _this.sourceName)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.publishedAt, _this.publishedAt) || other.publishedAt == _this.publishedAt)&&(identical(other.likes, _this.likes) || other.likes == _this.likes)&&(identical(other.comments, _this.comments) || other.comments == _this.comments)&&(identical(other.views, _this.views) || other.views == _this.views));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NewsDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.category,_this.sourceName,_this.imageUrl,_this.publishedAt,_this.likes,_this.comments,_this.views);
}

@override
String toString() {
  final _this = this as NewsDto;
  return 'NewsDto(id: ${_this.id}, title: ${_this.title}, category: ${_this.category}, sourceName: ${_this.sourceName}, imageUrl: ${_this.imageUrl}, publishedAt: ${_this.publishedAt}, likes: ${_this.likes}, comments: ${_this.comments}, views: ${_this.views})';
}


}

/// @nodoc
abstract mixin class $NewsDtoCopyWith<$Res>  {
  factory $NewsDtoCopyWith(NewsDto value, $Res Function(NewsDto) _then) = _$NewsDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? category, String? sourceName, String? imageUrl, String? publishedAt, int likes, int comments, int views
});




}
/// @nodoc
class _$NewsDtoCopyWithImpl<$Res>
    implements $NewsDtoCopyWith<$Res> {
  _$NewsDtoCopyWithImpl(this._self, this._then);

  final NewsDto _self;
  final $Res Function(NewsDto) _then;

/// Create a copy of NewsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? category = freezed,Object? sourceName = freezed,Object? imageUrl = freezed,Object? publishedAt = freezed,Object? likes = null,Object? comments = null,Object? views = null,}) {
  return _then(NewsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as int,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsDto].
extension NewsDtoPatterns on NewsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? category,  String? sourceName,  String? imageUrl,  String? publishedAt,  int likes,  int comments,  int views)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsDto() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.sourceName,_that.imageUrl,_that.publishedAt,_that.likes,_that.comments,_that.views);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? category,  String? sourceName,  String? imageUrl,  String? publishedAt,  int likes,  int comments,  int views)  $default,) {final _that = this;
switch (_that) {
case _NewsDto():
return $default(_that.id,_that.title,_that.category,_that.sourceName,_that.imageUrl,_that.publishedAt,_that.likes,_that.comments,_that.views);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? category,  String? sourceName,  String? imageUrl,  String? publishedAt,  int likes,  int comments,  int views)?  $default,) {final _that = this;
switch (_that) {
case _NewsDto() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.sourceName,_that.imageUrl,_that.publishedAt,_that.likes,_that.comments,_that.views);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsDto implements NewsDto {
   _NewsDto({required this.id, required this.title, required this.category, required this.sourceName, required this.imageUrl, required this.publishedAt, this.likes = 0, this.comments = 0, this.views = 0});
  factory _NewsDto.fromJson(Map<String, dynamic> json) => _$NewsDtoFromJson(json);

@override final  int id;
@override final  String title;
@override final  String? category;
@override final  String? sourceName;
@override final  String? imageUrl;
@override final  String? publishedAt;
@override@JsonKey() final  int likes;
@override@JsonKey() final  int comments;
@override@JsonKey() final  int views;

/// Create a copy of NewsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsDtoCopyWith<_NewsDto> get copyWith => __$NewsDtoCopyWithImpl<_NewsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.sourceName, sourceName) || other.sourceName == sourceName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.views, views) || other.views == views));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,category,sourceName,imageUrl,publishedAt,likes,comments,views);
}

@override
String toString() {
    return 'NewsDto(id: $id, title: $title, category: $category, sourceName: $sourceName, imageUrl: $imageUrl, publishedAt: $publishedAt, likes: $likes, comments: $comments, views: $views)';
}


}

/// @nodoc
abstract mixin class _$NewsDtoCopyWith<$Res> implements $NewsDtoCopyWith<$Res> {
  factory _$NewsDtoCopyWith(_NewsDto value, $Res Function(_NewsDto) _then) = __$NewsDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? category, String? sourceName, String? imageUrl, String? publishedAt, int likes, int comments, int views
});




}
/// @nodoc
class __$NewsDtoCopyWithImpl<$Res>
    implements _$NewsDtoCopyWith<$Res> {
  __$NewsDtoCopyWithImpl(this._self, this._then);

  final _NewsDto _self;
  final $Res Function(_NewsDto) _then;

/// Create a copy of NewsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? category = freezed,Object? sourceName = freezed,Object? imageUrl = freezed,Object? publishedAt = freezed,Object? likes = null,Object? comments = null,Object? views = null,}) {
  return _then(_NewsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,sourceName: freezed == sourceName ? _self.sourceName : sourceName // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as int,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
