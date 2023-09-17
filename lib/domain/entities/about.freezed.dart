// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$About {
  String get title => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get moreInfoUrl => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutCopyWith<About> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutCopyWith<$Res> {
  factory $AboutCopyWith(About value, $Res Function(About) then) =
      _$AboutCopyWithImpl<$Res, About>;
  @useResult
  $Res call({String title, String version, String moreInfoUrl, String message});
}

/// @nodoc
class _$AboutCopyWithImpl<$Res, $Val extends About>
    implements $AboutCopyWith<$Res> {
  _$AboutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? version = null,
    Object? moreInfoUrl = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      moreInfoUrl: null == moreInfoUrl
          ? _value.moreInfoUrl
          : moreInfoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutCopyWith<$Res> implements $AboutCopyWith<$Res> {
  factory _$$_AboutCopyWith(_$_About value, $Res Function(_$_About) then) =
      __$$_AboutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String version, String moreInfoUrl, String message});
}

/// @nodoc
class __$$_AboutCopyWithImpl<$Res> extends _$AboutCopyWithImpl<$Res, _$_About>
    implements _$$_AboutCopyWith<$Res> {
  __$$_AboutCopyWithImpl(_$_About _value, $Res Function(_$_About) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? version = null,
    Object? moreInfoUrl = null,
    Object? message = null,
  }) {
    return _then(_$_About(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      moreInfoUrl: null == moreInfoUrl
          ? _value.moreInfoUrl
          : moreInfoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_About with DiagnosticableTreeMixin implements _About {
  const _$_About(
      {required this.title,
      required this.version,
      required this.moreInfoUrl,
      required this.message});

  @override
  final String title;
  @override
  final String version;
  @override
  final String moreInfoUrl;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'About(title: $title, version: $version, moreInfoUrl: $moreInfoUrl, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'About'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('moreInfoUrl', moreInfoUrl))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_About &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.moreInfoUrl, moreInfoUrl) ||
                other.moreInfoUrl == moreInfoUrl) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, version, moreInfoUrl, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutCopyWith<_$_About> get copyWith =>
      __$$_AboutCopyWithImpl<_$_About>(this, _$identity);
}

abstract class _About implements About {
  const factory _About(
      {required final String title,
      required final String version,
      required final String moreInfoUrl,
      required final String message}) = _$_About;

  @override
  String get title;
  @override
  String get version;
  @override
  String get moreInfoUrl;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_AboutCopyWith<_$_About> get copyWith =>
      throw _privateConstructorUsedError;
}
