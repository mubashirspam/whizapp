part of 'initilize_bloc.dart';

@freezed
class InitilizeState with _$InitilizeState {
  const factory InitilizeState({
    required bool isLoading,
    required bool isToken,
    required bool connectionStatus,
    required bool forceUpdateNeeded,
    required HelpCenterModel? helpCenter,
    required bool isForceUpdate,
    required String message,
  }) = _InitilizeState;

  factory InitilizeState.initial() => const InitilizeState(
        isLoading: false,
        isToken: false,
        connectionStatus: false,
        helpCenter: null,
        forceUpdateNeeded: false,
        isForceUpdate: false,
        message: '',
      );
}
