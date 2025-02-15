// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) {
  return _BookResponse.fromJson(json);
}

/// @nodoc
mixin _$BookResponse {
  String? get kind => throw _privateConstructorUsedError;
  List<BookItem>? get items => throw _privateConstructorUsedError;

  /// Serializes this BookResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookResponseCopyWith<BookResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookResponseCopyWith<$Res> {
  factory $BookResponseCopyWith(
          BookResponse value, $Res Function(BookResponse) then) =
      _$BookResponseCopyWithImpl<$Res, BookResponse>;
  @useResult
  $Res call({String? kind, List<BookItem>? items});
}

/// @nodoc
class _$BookResponseCopyWithImpl<$Res, $Val extends BookResponse>
    implements $BookResponseCopyWith<$Res> {
  _$BookResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookResponseImplCopyWith<$Res>
    implements $BookResponseCopyWith<$Res> {
  factory _$$BookResponseImplCopyWith(
          _$BookResponseImpl value, $Res Function(_$BookResponseImpl) then) =
      __$$BookResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kind, List<BookItem>? items});
}

/// @nodoc
class __$$BookResponseImplCopyWithImpl<$Res>
    extends _$BookResponseCopyWithImpl<$Res, _$BookResponseImpl>
    implements _$$BookResponseImplCopyWith<$Res> {
  __$$BookResponseImplCopyWithImpl(
      _$BookResponseImpl _value, $Res Function(_$BookResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? items = freezed,
  }) {
    return _then(_$BookResponseImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookResponseImpl implements _BookResponse {
  const _$BookResponseImpl({this.kind, final List<BookItem>? items})
      : _items = items;

  factory _$BookResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookResponseImplFromJson(json);

  @override
  final String? kind;
  final List<BookItem>? _items;
  @override
  List<BookItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookResponse(kind: $kind, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookResponseImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(_items));

  /// Create a copy of BookResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookResponseImplCopyWith<_$BookResponseImpl> get copyWith =>
      __$$BookResponseImplCopyWithImpl<_$BookResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookResponseImplToJson(
      this,
    );
  }
}

abstract class _BookResponse implements BookResponse {
  const factory _BookResponse(
      {final String? kind, final List<BookItem>? items}) = _$BookResponseImpl;

  factory _BookResponse.fromJson(Map<String, dynamic> json) =
      _$BookResponseImpl.fromJson;

  @override
  String? get kind;
  @override
  List<BookItem>? get items;

  /// Create a copy of BookResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookResponseImplCopyWith<_$BookResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookItem _$BookItemFromJson(Map<String, dynamic> json) {
  return _BookItem.fromJson(json);
}

/// @nodoc
mixin _$BookItem {
  String? get kind => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get selfLink => throw _privateConstructorUsedError;
  VolumeInfo? get volumeInfo => throw _privateConstructorUsedError;

  /// Serializes this BookItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookItemCopyWith<BookItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookItemCopyWith<$Res> {
  factory $BookItemCopyWith(BookItem value, $Res Function(BookItem) then) =
      _$BookItemCopyWithImpl<$Res, BookItem>;
  @useResult
  $Res call(
      {String? kind, String? id, String? selfLink, VolumeInfo? volumeInfo});

  $VolumeInfoCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class _$BookItemCopyWithImpl<$Res, $Val extends BookItem>
    implements $BookItemCopyWith<$Res> {
  _$BookItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? id = freezed,
    Object? selfLink = freezed,
    Object? volumeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      selfLink: freezed == selfLink
          ? _value.selfLink
          : selfLink // ignore: cast_nullable_to_non_nullable
              as String?,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as VolumeInfo?,
    ) as $Val);
  }

  /// Create a copy of BookItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolumeInfoCopyWith<$Res>? get volumeInfo {
    if (_value.volumeInfo == null) {
      return null;
    }

    return $VolumeInfoCopyWith<$Res>(_value.volumeInfo!, (value) {
      return _then(_value.copyWith(volumeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookItemImplCopyWith<$Res>
    implements $BookItemCopyWith<$Res> {
  factory _$$BookItemImplCopyWith(
          _$BookItemImpl value, $Res Function(_$BookItemImpl) then) =
      __$$BookItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? kind, String? id, String? selfLink, VolumeInfo? volumeInfo});

  @override
  $VolumeInfoCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class __$$BookItemImplCopyWithImpl<$Res>
    extends _$BookItemCopyWithImpl<$Res, _$BookItemImpl>
    implements _$$BookItemImplCopyWith<$Res> {
  __$$BookItemImplCopyWithImpl(
      _$BookItemImpl _value, $Res Function(_$BookItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? id = freezed,
    Object? selfLink = freezed,
    Object? volumeInfo = freezed,
  }) {
    return _then(_$BookItemImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      selfLink: freezed == selfLink
          ? _value.selfLink
          : selfLink // ignore: cast_nullable_to_non_nullable
              as String?,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as VolumeInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookItemImpl implements _BookItem {
  const _$BookItemImpl({this.kind, this.id, this.selfLink, this.volumeInfo});

  factory _$BookItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookItemImplFromJson(json);

  @override
  final String? kind;
  @override
  final String? id;
  @override
  final String? selfLink;
  @override
  final VolumeInfo? volumeInfo;

  @override
  String toString() {
    return 'BookItem(kind: $kind, id: $id, selfLink: $selfLink, volumeInfo: $volumeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookItemImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.selfLink, selfLink) ||
                other.selfLink == selfLink) &&
            (identical(other.volumeInfo, volumeInfo) ||
                other.volumeInfo == volumeInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kind, id, selfLink, volumeInfo);

  /// Create a copy of BookItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookItemImplCopyWith<_$BookItemImpl> get copyWith =>
      __$$BookItemImplCopyWithImpl<_$BookItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookItemImplToJson(
      this,
    );
  }
}

abstract class _BookItem implements BookItem {
  const factory _BookItem(
      {final String? kind,
      final String? id,
      final String? selfLink,
      final VolumeInfo? volumeInfo}) = _$BookItemImpl;

  factory _BookItem.fromJson(Map<String, dynamic> json) =
      _$BookItemImpl.fromJson;

  @override
  String? get kind;
  @override
  String? get id;
  @override
  String? get selfLink;
  @override
  VolumeInfo? get volumeInfo;

  /// Create a copy of BookItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookItemImplCopyWith<_$BookItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) {
  return _VolumeInfo.fromJson(json);
}

/// @nodoc
mixin _$VolumeInfo {
  String? get title => throw _privateConstructorUsedError;
  List<String>? get authors => throw _privateConstructorUsedError;
  String? get publisher => throw _privateConstructorUsedError;
  String? get publishedDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get pageCount => throw _privateConstructorUsedError;
  double? get averageRating => throw _privateConstructorUsedError;
  int? get ratingsCount => throw _privateConstructorUsedError;
  ImageLinks? get imageLinks => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;

  /// Serializes this VolumeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VolumeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VolumeInfoCopyWith<VolumeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolumeInfoCopyWith<$Res> {
  factory $VolumeInfoCopyWith(
          VolumeInfo value, $Res Function(VolumeInfo) then) =
      _$VolumeInfoCopyWithImpl<$Res, VolumeInfo>;
  @useResult
  $Res call(
      {String? title,
      List<String>? authors,
      String? publisher,
      String? publishedDate,
      String? description,
      int? pageCount,
      double? averageRating,
      int? ratingsCount,
      ImageLinks? imageLinks,
      String? language});

  $ImageLinksCopyWith<$Res>? get imageLinks;
}

/// @nodoc
class _$VolumeInfoCopyWithImpl<$Res, $Val extends VolumeInfo>
    implements $VolumeInfoCopyWith<$Res> {
  _$VolumeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VolumeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? authors = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? description = freezed,
    Object? pageCount = freezed,
    Object? averageRating = freezed,
    Object? ratingsCount = freezed,
    Object? imageLinks = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingsCount: freezed == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageLinks: freezed == imageLinks
          ? _value.imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as ImageLinks?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of VolumeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageLinksCopyWith<$Res>? get imageLinks {
    if (_value.imageLinks == null) {
      return null;
    }

    return $ImageLinksCopyWith<$Res>(_value.imageLinks!, (value) {
      return _then(_value.copyWith(imageLinks: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VolumeInfoImplCopyWith<$Res>
    implements $VolumeInfoCopyWith<$Res> {
  factory _$$VolumeInfoImplCopyWith(
          _$VolumeInfoImpl value, $Res Function(_$VolumeInfoImpl) then) =
      __$$VolumeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      List<String>? authors,
      String? publisher,
      String? publishedDate,
      String? description,
      int? pageCount,
      double? averageRating,
      int? ratingsCount,
      ImageLinks? imageLinks,
      String? language});

  @override
  $ImageLinksCopyWith<$Res>? get imageLinks;
}

/// @nodoc
class __$$VolumeInfoImplCopyWithImpl<$Res>
    extends _$VolumeInfoCopyWithImpl<$Res, _$VolumeInfoImpl>
    implements _$$VolumeInfoImplCopyWith<$Res> {
  __$$VolumeInfoImplCopyWithImpl(
      _$VolumeInfoImpl _value, $Res Function(_$VolumeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolumeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? authors = freezed,
    Object? publisher = freezed,
    Object? publishedDate = freezed,
    Object? description = freezed,
    Object? pageCount = freezed,
    Object? averageRating = freezed,
    Object? ratingsCount = freezed,
    Object? imageLinks = freezed,
    Object? language = freezed,
  }) {
    return _then(_$VolumeInfoImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      publisher: freezed == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedDate: freezed == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pageCount: freezed == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingsCount: freezed == ratingsCount
          ? _value.ratingsCount
          : ratingsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageLinks: freezed == imageLinks
          ? _value.imageLinks
          : imageLinks // ignore: cast_nullable_to_non_nullable
              as ImageLinks?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VolumeInfoImpl implements _VolumeInfo {
  const _$VolumeInfoImpl(
      {this.title,
      final List<String>? authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.averageRating,
      this.ratingsCount,
      this.imageLinks,
      this.language})
      : _authors = authors;

  factory _$VolumeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VolumeInfoImplFromJson(json);

  @override
  final String? title;
  final List<String>? _authors;
  @override
  List<String>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? publisher;
  @override
  final String? publishedDate;
  @override
  final String? description;
  @override
  final int? pageCount;
  @override
  final double? averageRating;
  @override
  final int? ratingsCount;
  @override
  final ImageLinks? imageLinks;
  @override
  final String? language;

  @override
  String toString() {
    return 'VolumeInfo(title: $title, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, averageRating: $averageRating, ratingsCount: $ratingsCount, imageLinks: $imageLinks, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolumeInfoImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.ratingsCount, ratingsCount) ||
                other.ratingsCount == ratingsCount) &&
            (identical(other.imageLinks, imageLinks) ||
                other.imageLinks == imageLinks) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_authors),
      publisher,
      publishedDate,
      description,
      pageCount,
      averageRating,
      ratingsCount,
      imageLinks,
      language);

  /// Create a copy of VolumeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VolumeInfoImplCopyWith<_$VolumeInfoImpl> get copyWith =>
      __$$VolumeInfoImplCopyWithImpl<_$VolumeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VolumeInfoImplToJson(
      this,
    );
  }
}

abstract class _VolumeInfo implements VolumeInfo {
  const factory _VolumeInfo(
      {final String? title,
      final List<String>? authors,
      final String? publisher,
      final String? publishedDate,
      final String? description,
      final int? pageCount,
      final double? averageRating,
      final int? ratingsCount,
      final ImageLinks? imageLinks,
      final String? language}) = _$VolumeInfoImpl;

  factory _VolumeInfo.fromJson(Map<String, dynamic> json) =
      _$VolumeInfoImpl.fromJson;

  @override
  String? get title;
  @override
  List<String>? get authors;
  @override
  String? get publisher;
  @override
  String? get publishedDate;
  @override
  String? get description;
  @override
  int? get pageCount;
  @override
  double? get averageRating;
  @override
  int? get ratingsCount;
  @override
  ImageLinks? get imageLinks;
  @override
  String? get language;

  /// Create a copy of VolumeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VolumeInfoImplCopyWith<_$VolumeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) {
  return _ImageLinks.fromJson(json);
}

/// @nodoc
mixin _$ImageLinks {
  String? get smallThumbnail => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  /// Serializes this ImageLinks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageLinksCopyWith<ImageLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageLinksCopyWith<$Res> {
  factory $ImageLinksCopyWith(
          ImageLinks value, $Res Function(ImageLinks) then) =
      _$ImageLinksCopyWithImpl<$Res, ImageLinks>;
  @useResult
  $Res call({String? smallThumbnail, String? thumbnail});
}

/// @nodoc
class _$ImageLinksCopyWithImpl<$Res, $Val extends ImageLinks>
    implements $ImageLinksCopyWith<$Res> {
  _$ImageLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallThumbnail = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      smallThumbnail: freezed == smallThumbnail
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageLinksImplCopyWith<$Res>
    implements $ImageLinksCopyWith<$Res> {
  factory _$$ImageLinksImplCopyWith(
          _$ImageLinksImpl value, $Res Function(_$ImageLinksImpl) then) =
      __$$ImageLinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? smallThumbnail, String? thumbnail});
}

/// @nodoc
class __$$ImageLinksImplCopyWithImpl<$Res>
    extends _$ImageLinksCopyWithImpl<$Res, _$ImageLinksImpl>
    implements _$$ImageLinksImplCopyWith<$Res> {
  __$$ImageLinksImplCopyWithImpl(
      _$ImageLinksImpl _value, $Res Function(_$ImageLinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageLinks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smallThumbnail = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$ImageLinksImpl(
      smallThumbnail: freezed == smallThumbnail
          ? _value.smallThumbnail
          : smallThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageLinksImpl implements _ImageLinks {
  const _$ImageLinksImpl({this.smallThumbnail, this.thumbnail});

  factory _$ImageLinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageLinksImplFromJson(json);

  @override
  final String? smallThumbnail;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'ImageLinks(smallThumbnail: $smallThumbnail, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageLinksImpl &&
            (identical(other.smallThumbnail, smallThumbnail) ||
                other.smallThumbnail == smallThumbnail) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, smallThumbnail, thumbnail);

  /// Create a copy of ImageLinks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageLinksImplCopyWith<_$ImageLinksImpl> get copyWith =>
      __$$ImageLinksImplCopyWithImpl<_$ImageLinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageLinksImplToJson(
      this,
    );
  }
}

abstract class _ImageLinks implements ImageLinks {
  const factory _ImageLinks(
      {final String? smallThumbnail,
      final String? thumbnail}) = _$ImageLinksImpl;

  factory _ImageLinks.fromJson(Map<String, dynamic> json) =
      _$ImageLinksImpl.fromJson;

  @override
  String? get smallThumbnail;
  @override
  String? get thumbnail;

  /// Create a copy of ImageLinks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageLinksImplCopyWith<_$ImageLinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
