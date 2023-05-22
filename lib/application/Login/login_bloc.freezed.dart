// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetOtpCopyWith<$Res> {
  factory _$$_GetOtpCopyWith(_$_GetOtp value, $Res Function(_$_GetOtp) then) =
      __$$_GetOtpCopyWithImpl<$Res>;
  @useResult
  $Res call({int phone});
}

/// @nodoc
class __$$_GetOtpCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_GetOtp>
    implements _$$_GetOtpCopyWith<$Res> {
  __$$_GetOtpCopyWithImpl(_$_GetOtp _value, $Res Function(_$_GetOtp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$_GetOtp(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetOtp implements _GetOtp {
  const _$_GetOtp({required this.phone});

  @override
  final int phone;

  @override
  String toString() {
    return 'LoginEvent.getOtp(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetOtp &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetOtpCopyWith<_$_GetOtp> get copyWith =>
      __$$_GetOtpCopyWithImpl<_$_GetOtp>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return getOtp(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return getOtp?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (getOtp != null) {
      return getOtp(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return getOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return getOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (getOtp != null) {
      return getOtp(this);
    }
    return orElse();
  }
}

abstract class _GetOtp implements LoginEvent {
  const factory _GetOtp({required final int phone}) = _$_GetOtp;

  int get phone;
  @JsonKey(ignore: true)
  _$$_GetOtpCopyWith<_$_GetOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OptValidationCopyWith<$Res> {
  factory _$$_OptValidationCopyWith(
          _$_OptValidation value, $Res Function(_$_OptValidation) then) =
      __$$_OptValidationCopyWithImpl<$Res>;
  @useResult
  $Res call({int phone, int otp});
}

/// @nodoc
class __$$_OptValidationCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_OptValidation>
    implements _$$_OptValidationCopyWith<$Res> {
  __$$_OptValidationCopyWithImpl(
      _$_OptValidation _value, $Res Function(_$_OptValidation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? otp = null,
  }) {
    return _then(_$_OptValidation(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OptValidation implements _OptValidation {
  const _$_OptValidation({required this.phone, required this.otp});

  @override
  final int phone;
  @override
  final int otp;

  @override
  String toString() {
    return 'LoginEvent.optValidation(phone: $phone, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OptValidation &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptValidationCopyWith<_$_OptValidation> get copyWith =>
      __$$_OptValidationCopyWithImpl<_$_OptValidation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return optValidation(phone, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return optValidation?.call(phone, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (optValidation != null) {
      return optValidation(phone, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return optValidation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return optValidation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (optValidation != null) {
      return optValidation(this);
    }
    return orElse();
  }
}

abstract class _OptValidation implements LoginEvent {
  const factory _OptValidation(
      {required final int phone, required final int otp}) = _$_OptValidation;

  int get phone;
  int get otp;
  @JsonKey(ignore: true)
  _$$_OptValidationCopyWith<_$_OptValidation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResentOtpCopyWith<$Res> {
  factory _$$_ResentOtpCopyWith(
          _$_ResentOtp value, $Res Function(_$_ResentOtp) then) =
      __$$_ResentOtpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResentOtpCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_ResentOtp>
    implements _$$_ResentOtpCopyWith<$Res> {
  __$$_ResentOtpCopyWithImpl(
      _$_ResentOtp _value, $Res Function(_$_ResentOtp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResentOtp implements _ResentOtp {
  const _$_ResentOtp();

  @override
  String toString() {
    return 'LoginEvent.reSentOtp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResentOtp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return reSentOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return reSentOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (reSentOtp != null) {
      return reSentOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return reSentOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return reSentOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (reSentOtp != null) {
      return reSentOtp(this);
    }
    return orElse();
  }
}

abstract class _ResentOtp implements LoginEvent {
  const factory _ResentOtp() = _$_ResentOtp;
}

/// @nodoc
abstract class _$$_ChangeNumberCopyWith<$Res> {
  factory _$$_ChangeNumberCopyWith(
          _$_ChangeNumber value, $Res Function(_$_ChangeNumber) then) =
      __$$_ChangeNumberCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ChangeNumberCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_ChangeNumber>
    implements _$$_ChangeNumberCopyWith<$Res> {
  __$$_ChangeNumberCopyWithImpl(
      _$_ChangeNumber _value, $Res Function(_$_ChangeNumber) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ChangeNumber implements _ChangeNumber {
  const _$_ChangeNumber();

  @override
  String toString() {
    return 'LoginEvent.changeNumber()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ChangeNumber);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return changeNumber();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return changeNumber?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (changeNumber != null) {
      return changeNumber();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return changeNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return changeNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (changeNumber != null) {
      return changeNumber(this);
    }
    return orElse();
  }
}

abstract class _ChangeNumber implements LoginEvent {
  const factory _ChangeNumber() = _$_ChangeNumber;
}

/// @nodoc
abstract class _$$_LogOutCopyWith<$Res> {
  factory _$$_LogOutCopyWith(_$_LogOut value, $Res Function(_$_LogOut) then) =
      __$$_LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_LogOut>
    implements _$$_LogOutCopyWith<$Res> {
  __$$_LogOutCopyWithImpl(_$_LogOut _value, $Res Function(_$_LogOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LogOut implements _LogOut {
  const _$_LogOut();

  @override
  String toString() {
    return 'LoginEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements LoginEvent {
  const factory _LogOut() = _$_LogOut;
}

/// @nodoc
abstract class _$$_EmailRegisterCopyWith<$Res> {
  factory _$$_EmailRegisterCopyWith(
          _$_EmailRegister value, $Res Function(_$_EmailRegister) then) =
      __$$_EmailRegisterCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_EmailRegisterCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_EmailRegister>
    implements _$$_EmailRegisterCopyWith<$Res> {
  __$$_EmailRegisterCopyWithImpl(
      _$_EmailRegister _value, $Res Function(_$_EmailRegister) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_EmailRegister(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailRegister implements _EmailRegister {
  const _$_EmailRegister({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.emailRegister(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailRegister &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailRegisterCopyWith<_$_EmailRegister> get copyWith =>
      __$$_EmailRegisterCopyWithImpl<_$_EmailRegister>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return emailRegister(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return emailRegister?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (emailRegister != null) {
      return emailRegister(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return emailRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return emailRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (emailRegister != null) {
      return emailRegister(this);
    }
    return orElse();
  }
}

abstract class _EmailRegister implements LoginEvent {
  const factory _EmailRegister(
      {required final String email,
      required final String password}) = _$_EmailRegister;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_EmailRegisterCopyWith<_$_EmailRegister> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmailLoginCopyWith<$Res> {
  factory _$$_EmailLoginCopyWith(
          _$_EmailLogin value, $Res Function(_$_EmailLogin) then) =
      __$$_EmailLoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_EmailLoginCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_EmailLogin>
    implements _$$_EmailLoginCopyWith<$Res> {
  __$$_EmailLoginCopyWithImpl(
      _$_EmailLogin _value, $Res Function(_$_EmailLogin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_EmailLogin(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailLogin implements _EmailLogin {
  const _$_EmailLogin({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.emailLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailLogin &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailLoginCopyWith<_$_EmailLogin> get copyWith =>
      __$$_EmailLoginCopyWithImpl<_$_EmailLogin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int phone) getOtp,
    required TResult Function(int phone, int otp) optValidation,
    required TResult Function() reSentOtp,
    required TResult Function() changeNumber,
    required TResult Function() logOut,
    required TResult Function(String email, String password) emailRegister,
    required TResult Function(String email, String password) emailLogin,
  }) {
    return emailLogin(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int phone)? getOtp,
    TResult? Function(int phone, int otp)? optValidation,
    TResult? Function()? reSentOtp,
    TResult? Function()? changeNumber,
    TResult? Function()? logOut,
    TResult? Function(String email, String password)? emailRegister,
    TResult? Function(String email, String password)? emailLogin,
  }) {
    return emailLogin?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int phone)? getOtp,
    TResult Function(int phone, int otp)? optValidation,
    TResult Function()? reSentOtp,
    TResult Function()? changeNumber,
    TResult Function()? logOut,
    TResult Function(String email, String password)? emailRegister,
    TResult Function(String email, String password)? emailLogin,
    required TResult orElse(),
  }) {
    if (emailLogin != null) {
      return emailLogin(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_OptValidation value) optValidation,
    required TResult Function(_ResentOtp value) reSentOtp,
    required TResult Function(_ChangeNumber value) changeNumber,
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_EmailRegister value) emailRegister,
    required TResult Function(_EmailLogin value) emailLogin,
  }) {
    return emailLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_OptValidation value)? optValidation,
    TResult? Function(_ResentOtp value)? reSentOtp,
    TResult? Function(_ChangeNumber value)? changeNumber,
    TResult? Function(_LogOut value)? logOut,
    TResult? Function(_EmailRegister value)? emailRegister,
    TResult? Function(_EmailLogin value)? emailLogin,
  }) {
    return emailLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_OptValidation value)? optValidation,
    TResult Function(_ResentOtp value)? reSentOtp,
    TResult Function(_ChangeNumber value)? changeNumber,
    TResult Function(_LogOut value)? logOut,
    TResult Function(_EmailRegister value)? emailRegister,
    TResult Function(_EmailLogin value)? emailLogin,
    required TResult orElse(),
  }) {
    if (emailLogin != null) {
      return emailLogin(this);
    }
    return orElse();
  }
}

abstract class _EmailLogin implements LoginEvent {
  const factory _EmailLogin(
      {required final String email,
      required final String password}) = _$_EmailLogin;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_EmailLoginCopyWith<_$_EmailLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get hasOtpData => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  int get coundownTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool hasOtpData,
      String? verificationId,
      String? statusMessage,
      int coundownTime});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? hasOtpData = null,
    Object? verificationId = freezed,
    Object? statusMessage = freezed,
    Object? coundownTime = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      hasOtpData: null == hasOtpData
          ? _value.hasOtpData
          : hasOtpData // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      coundownTime: null == coundownTime
          ? _value.coundownTime
          : coundownTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool hasOtpData,
      String? verificationId,
      String? statusMessage,
      int coundownTime});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? hasOtpData = null,
    Object? verificationId = freezed,
    Object? statusMessage = freezed,
    Object? coundownTime = null,
  }) {
    return _then(_$_LoginState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      hasOtpData: null == hasOtpData
          ? _value.hasOtpData
          : hasOtpData // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      coundownTime: null == coundownTime
          ? _value.coundownTime
          : coundownTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {required this.isLoading,
      required this.isError,
      required this.hasOtpData,
      required this.verificationId,
      required this.statusMessage,
      required this.coundownTime});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool hasOtpData;
  @override
  final String? verificationId;
  @override
  final String? statusMessage;
  @override
  final int coundownTime;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, isError: $isError, hasOtpData: $hasOtpData, verificationId: $verificationId, statusMessage: $statusMessage, coundownTime: $coundownTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.hasOtpData, hasOtpData) ||
                other.hasOtpData == hasOtpData) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.coundownTime, coundownTime) ||
                other.coundownTime == coundownTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, hasOtpData,
      verificationId, statusMessage, coundownTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final bool isLoading,
      required final bool isError,
      required final bool hasOtpData,
      required final String? verificationId,
      required final String? statusMessage,
      required final int coundownTime}) = _$_LoginState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get hasOtpData;
  @override
  String? get verificationId;
  @override
  String? get statusMessage;
  @override
  int get coundownTime;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
