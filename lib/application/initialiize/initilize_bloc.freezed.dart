// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initilize_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitilizeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool connectionstatus) contectionChanged,
    required TResult Function() connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool connectionstatus)? contectionChanged,
    TResult? Function()? connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool connectionstatus)? contectionChanged,
    TResult Function()? connectionCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContectionChanged value) contectionChanged,
    required TResult Function(_ConnectionCheck value) connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContectionChanged value)? contectionChanged,
    TResult? Function(_ConnectionCheck value)? connectionCheck,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContectionChanged value)? contectionChanged,
    TResult Function(_ConnectionCheck value)? connectionCheck,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitilizeEventCopyWith<$Res> {
  factory $InitilizeEventCopyWith(
          InitilizeEvent value, $Res Function(InitilizeEvent) then) =
      _$InitilizeEventCopyWithImpl<$Res, InitilizeEvent>;
}

/// @nodoc
class _$InitilizeEventCopyWithImpl<$Res, $Val extends InitilizeEvent>
    implements $InitilizeEventCopyWith<$Res> {
  _$InitilizeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$InitilizeEventCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'InitilizeEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool connectionstatus) contectionChanged,
    required TResult Function() connectionCheck,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool connectionstatus)? contectionChanged,
    TResult? Function()? connectionCheck,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool connectionstatus)? contectionChanged,
    TResult Function()? connectionCheck,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContectionChanged value) contectionChanged,
    required TResult Function(_ConnectionCheck value) connectionCheck,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContectionChanged value)? contectionChanged,
    TResult? Function(_ConnectionCheck value)? connectionCheck,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContectionChanged value)? contectionChanged,
    TResult Function(_ConnectionCheck value)? connectionCheck,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements InitilizeEvent {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_ContectionChangedCopyWith<$Res> {
  factory _$$_ContectionChangedCopyWith(_$_ContectionChanged value,
          $Res Function(_$_ContectionChanged) then) =
      __$$_ContectionChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool connectionstatus});
}

/// @nodoc
class __$$_ContectionChangedCopyWithImpl<$Res>
    extends _$InitilizeEventCopyWithImpl<$Res, _$_ContectionChanged>
    implements _$$_ContectionChangedCopyWith<$Res> {
  __$$_ContectionChangedCopyWithImpl(
      _$_ContectionChanged _value, $Res Function(_$_ContectionChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectionstatus = null,
  }) {
    return _then(_$_ContectionChanged(
      connectionstatus: null == connectionstatus
          ? _value.connectionstatus
          : connectionstatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ContectionChanged implements _ContectionChanged {
  const _$_ContectionChanged({required this.connectionstatus});

  @override
  final bool connectionstatus;

  @override
  String toString() {
    return 'InitilizeEvent.contectionChanged(connectionstatus: $connectionstatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContectionChanged &&
            (identical(other.connectionstatus, connectionstatus) ||
                other.connectionstatus == connectionstatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectionstatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContectionChangedCopyWith<_$_ContectionChanged> get copyWith =>
      __$$_ContectionChangedCopyWithImpl<_$_ContectionChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool connectionstatus) contectionChanged,
    required TResult Function() connectionCheck,
  }) {
    return contectionChanged(connectionstatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool connectionstatus)? contectionChanged,
    TResult? Function()? connectionCheck,
  }) {
    return contectionChanged?.call(connectionstatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool connectionstatus)? contectionChanged,
    TResult Function()? connectionCheck,
    required TResult orElse(),
  }) {
    if (contectionChanged != null) {
      return contectionChanged(connectionstatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContectionChanged value) contectionChanged,
    required TResult Function(_ConnectionCheck value) connectionCheck,
  }) {
    return contectionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContectionChanged value)? contectionChanged,
    TResult? Function(_ConnectionCheck value)? connectionCheck,
  }) {
    return contectionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContectionChanged value)? contectionChanged,
    TResult Function(_ConnectionCheck value)? connectionCheck,
    required TResult orElse(),
  }) {
    if (contectionChanged != null) {
      return contectionChanged(this);
    }
    return orElse();
  }
}

abstract class _ContectionChanged implements InitilizeEvent {
  const factory _ContectionChanged({required final bool connectionstatus}) =
      _$_ContectionChanged;

  bool get connectionstatus;
  @JsonKey(ignore: true)
  _$$_ContectionChangedCopyWith<_$_ContectionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectionCheckCopyWith<$Res> {
  factory _$$_ConnectionCheckCopyWith(
          _$_ConnectionCheck value, $Res Function(_$_ConnectionCheck) then) =
      __$$_ConnectionCheckCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectionCheckCopyWithImpl<$Res>
    extends _$InitilizeEventCopyWithImpl<$Res, _$_ConnectionCheck>
    implements _$$_ConnectionCheckCopyWith<$Res> {
  __$$_ConnectionCheckCopyWithImpl(
      _$_ConnectionCheck _value, $Res Function(_$_ConnectionCheck) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConnectionCheck implements _ConnectionCheck {
  const _$_ConnectionCheck();

  @override
  String toString() {
    return 'InitilizeEvent.connectionCheck()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConnectionCheck);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool connectionstatus) contectionChanged,
    required TResult Function() connectionCheck,
  }) {
    return connectionCheck();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool connectionstatus)? contectionChanged,
    TResult? Function()? connectionCheck,
  }) {
    return connectionCheck?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool connectionstatus)? contectionChanged,
    TResult Function()? connectionCheck,
    required TResult orElse(),
  }) {
    if (connectionCheck != null) {
      return connectionCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ContectionChanged value) contectionChanged,
    required TResult Function(_ConnectionCheck value) connectionCheck,
  }) {
    return connectionCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ContectionChanged value)? contectionChanged,
    TResult? Function(_ConnectionCheck value)? connectionCheck,
  }) {
    return connectionCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ContectionChanged value)? contectionChanged,
    TResult Function(_ConnectionCheck value)? connectionCheck,
    required TResult orElse(),
  }) {
    if (connectionCheck != null) {
      return connectionCheck(this);
    }
    return orElse();
  }
}

abstract class _ConnectionCheck implements InitilizeEvent {
  const factory _ConnectionCheck() = _$_ConnectionCheck;
}

/// @nodoc
mixin _$InitilizeState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isToken => throw _privateConstructorUsedError;
  bool get connectionStatus => throw _privateConstructorUsedError;
  bool get forceUpdateNeeded => throw _privateConstructorUsedError;
  HelpCenterModel? get helpCenter => throw _privateConstructorUsedError;
  bool get isForceUpdate => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitilizeStateCopyWith<InitilizeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitilizeStateCopyWith<$Res> {
  factory $InitilizeStateCopyWith(
          InitilizeState value, $Res Function(InitilizeState) then) =
      _$InitilizeStateCopyWithImpl<$Res, InitilizeState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isToken,
      bool connectionStatus,
      bool forceUpdateNeeded,
      HelpCenterModel? helpCenter,
      bool isForceUpdate,
      String message});
}

/// @nodoc
class _$InitilizeStateCopyWithImpl<$Res, $Val extends InitilizeState>
    implements $InitilizeStateCopyWith<$Res> {
  _$InitilizeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isToken = null,
    Object? connectionStatus = null,
    Object? forceUpdateNeeded = null,
    Object? helpCenter = freezed,
    Object? isForceUpdate = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isToken: null == isToken
          ? _value.isToken
          : isToken // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      forceUpdateNeeded: null == forceUpdateNeeded
          ? _value.forceUpdateNeeded
          : forceUpdateNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      helpCenter: freezed == helpCenter
          ? _value.helpCenter
          : helpCenter // ignore: cast_nullable_to_non_nullable
              as HelpCenterModel?,
      isForceUpdate: null == isForceUpdate
          ? _value.isForceUpdate
          : isForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitilizeStateCopyWith<$Res>
    implements $InitilizeStateCopyWith<$Res> {
  factory _$$_InitilizeStateCopyWith(
          _$_InitilizeState value, $Res Function(_$_InitilizeState) then) =
      __$$_InitilizeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isToken,
      bool connectionStatus,
      bool forceUpdateNeeded,
      HelpCenterModel? helpCenter,
      bool isForceUpdate,
      String message});
}

/// @nodoc
class __$$_InitilizeStateCopyWithImpl<$Res>
    extends _$InitilizeStateCopyWithImpl<$Res, _$_InitilizeState>
    implements _$$_InitilizeStateCopyWith<$Res> {
  __$$_InitilizeStateCopyWithImpl(
      _$_InitilizeState _value, $Res Function(_$_InitilizeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isToken = null,
    Object? connectionStatus = null,
    Object? forceUpdateNeeded = null,
    Object? helpCenter = freezed,
    Object? isForceUpdate = null,
    Object? message = null,
  }) {
    return _then(_$_InitilizeState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isToken: null == isToken
          ? _value.isToken
          : isToken // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      forceUpdateNeeded: null == forceUpdateNeeded
          ? _value.forceUpdateNeeded
          : forceUpdateNeeded // ignore: cast_nullable_to_non_nullable
              as bool,
      helpCenter: freezed == helpCenter
          ? _value.helpCenter
          : helpCenter // ignore: cast_nullable_to_non_nullable
              as HelpCenterModel?,
      isForceUpdate: null == isForceUpdate
          ? _value.isForceUpdate
          : isForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InitilizeState implements _InitilizeState {
  const _$_InitilizeState(
      {required this.isLoading,
      required this.isToken,
      required this.connectionStatus,
      required this.forceUpdateNeeded,
      required this.helpCenter,
      required this.isForceUpdate,
      required this.message});

  @override
  final bool isLoading;
  @override
  final bool isToken;
  @override
  final bool connectionStatus;
  @override
  final bool forceUpdateNeeded;
  @override
  final HelpCenterModel? helpCenter;
  @override
  final bool isForceUpdate;
  @override
  final String message;

  @override
  String toString() {
    return 'InitilizeState(isLoading: $isLoading, isToken: $isToken, connectionStatus: $connectionStatus, forceUpdateNeeded: $forceUpdateNeeded, helpCenter: $helpCenter, isForceUpdate: $isForceUpdate, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitilizeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isToken, isToken) || other.isToken == isToken) &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus) &&
            (identical(other.forceUpdateNeeded, forceUpdateNeeded) ||
                other.forceUpdateNeeded == forceUpdateNeeded) &&
            (identical(other.helpCenter, helpCenter) ||
                other.helpCenter == helpCenter) &&
            (identical(other.isForceUpdate, isForceUpdate) ||
                other.isForceUpdate == isForceUpdate) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isToken,
      connectionStatus, forceUpdateNeeded, helpCenter, isForceUpdate, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitilizeStateCopyWith<_$_InitilizeState> get copyWith =>
      __$$_InitilizeStateCopyWithImpl<_$_InitilizeState>(this, _$identity);
}

abstract class _InitilizeState implements InitilizeState {
  const factory _InitilizeState(
      {required final bool isLoading,
      required final bool isToken,
      required final bool connectionStatus,
      required final bool forceUpdateNeeded,
      required final HelpCenterModel? helpCenter,
      required final bool isForceUpdate,
      required final String message}) = _$_InitilizeState;

  @override
  bool get isLoading;
  @override
  bool get isToken;
  @override
  bool get connectionStatus;
  @override
  bool get forceUpdateNeeded;
  @override
  HelpCenterModel? get helpCenter;
  @override
  bool get isForceUpdate;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_InitilizeStateCopyWith<_$_InitilizeState> get copyWith =>
      throw _privateConstructorUsedError;
}
