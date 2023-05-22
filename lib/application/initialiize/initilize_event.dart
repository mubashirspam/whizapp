part of 'initilize_bloc.dart';

@freezed
class InitilizeEvent with _$InitilizeEvent {
  const factory InitilizeEvent.initial() = _Initial;
  const factory InitilizeEvent.contectionChanged({
    required bool connectionstatus,
  }) = _ContectionChanged;

  const factory InitilizeEvent.connectionCheck() = _ConnectionCheck;
}
