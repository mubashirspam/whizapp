part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required bool isError,
    required bool hasOtpData,
    required String? verificationId,
    required String? statusMessage,
    required int coundownTime,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
      isLoading: false,
      isError: false,
      hasOtpData: false,
      coundownTime: 0,
      verificationId: null,
      statusMessage: null);
}
