part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.getOtp({
    required int phone,
  }) = _GetOtp;

  const factory LoginEvent.optValidation({
    required int phone,
    required int otp,
  }) = _OptValidation;

  const factory LoginEvent.reSentOtp() = _ResentOtp;
  const factory LoginEvent.changeNumber() = _ChangeNumber;
  const factory LoginEvent.logOut() = _LogOut;

  const factory LoginEvent.emailRegister({
    required String email,
    required String password,
  }) = _EmailRegister;

  const factory LoginEvent.emailLogin({
    required String email,
    required String password,
  }) = _EmailLogin;
}
