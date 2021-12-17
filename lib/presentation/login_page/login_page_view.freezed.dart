// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_page_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginPageDataTearOff {
  const _$LoginPageDataTearOff();

  _LoginPageData call({required bool inProgress, Object? error, User? user}) {
    return _LoginPageData(
      inProgress: inProgress,
      error: error,
      user: user,
    );
  }
}

/// @nodoc
const $LoginPageData = _$LoginPageDataTearOff();

/// @nodoc
mixin _$LoginPageData {
  bool get inProgress => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageDataCopyWith<LoginPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageDataCopyWith<$Res> {
  factory $LoginPageDataCopyWith(
          LoginPageData value, $Res Function(LoginPageData) then) =
      _$LoginPageDataCopyWithImpl<$Res>;
  $Res call({bool inProgress, Object? error, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginPageDataCopyWithImpl<$Res>
    implements $LoginPageDataCopyWith<$Res> {
  _$LoginPageDataCopyWithImpl(this._value, this._then);

  final LoginPageData _value;
  // ignore: unused_field
  final $Res Function(LoginPageData) _then;

  @override
  $Res call({
    Object? inProgress = freezed,
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$LoginPageDataCopyWith<$Res>
    implements $LoginPageDataCopyWith<$Res> {
  factory _$LoginPageDataCopyWith(
          _LoginPageData value, $Res Function(_LoginPageData) then) =
      __$LoginPageDataCopyWithImpl<$Res>;
  @override
  $Res call({bool inProgress, Object? error, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoginPageDataCopyWithImpl<$Res>
    extends _$LoginPageDataCopyWithImpl<$Res>
    implements _$LoginPageDataCopyWith<$Res> {
  __$LoginPageDataCopyWithImpl(
      _LoginPageData _value, $Res Function(_LoginPageData) _then)
      : super(_value, (v) => _then(v as _LoginPageData));

  @override
  _LoginPageData get _value => super._value as _LoginPageData;

  @override
  $Res call({
    Object? inProgress = freezed,
    Object? error = freezed,
    Object? user = freezed,
  }) {
    return _then(_LoginPageData(
      inProgress: inProgress == freezed
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_LoginPageData implements _LoginPageData {
  const _$_LoginPageData({required this.inProgress, this.error, this.user});

  @override
  final bool inProgress;
  @override
  final Object? error;
  @override
  final User? user;

  @override
  String toString() {
    return 'LoginPageData(inProgress: $inProgress, error: $error, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginPageData &&
            const DeepCollectionEquality()
                .equals(other.inProgress, inProgress) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inProgress),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$LoginPageDataCopyWith<_LoginPageData> get copyWith =>
      __$LoginPageDataCopyWithImpl<_LoginPageData>(this, _$identity);
}

abstract class _LoginPageData implements LoginPageData {
  const factory _LoginPageData(
      {required bool inProgress, Object? error, User? user}) = _$_LoginPageData;

  @override
  bool get inProgress;
  @override
  Object? get error;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$LoginPageDataCopyWith<_LoginPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
