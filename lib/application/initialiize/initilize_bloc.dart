import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:whizapp/core/constants.dart';
import 'package:whizapp/core/secure_storage.dart';
import 'package:whizapp/domain/help_center/model/help_center.dart';

part 'initilize_event.dart';
part 'initilize_state.dart';
part 'initilize_bloc.freezed.dart';

@injectable
class InitilizeBloc extends Bloc<InitilizeEvent, InitilizeState> {
  // final IForceUpdateRepos _iForceUpdateRepos;
  FirebaseAuth auth = FirebaseAuth.instance;
  InitilizeBloc() : super(InitilizeState.initial()) {
    StreamSubscription subscription;

    subscription =
        InternetConnectionCheckerPlus().onStatusChange.listen((result) {
      add(_ContectionChanged(
          connectionstatus:
              result == InternetConnectionStatus.disconnected ? false : true));
    });

    on<_ContectionChanged>((event, emit) async {
      emit(state.copyWith(
        connectionStatus: event.connectionstatus,
      ));
    });

    on<_Initial>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          isToken: false,
          isForceUpdate: false,
        ),
      );

      // final r = await _iForceUpdateRepos.getFirebaseConfigData();
      // PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // String buildNumber = packageInfo.buildNumber;

      // r.fold((l) {}, (r) {
      //   if (r.buildNo != null &&
      //       int.parse(r.buildNo!) > int.parse(buildNumber)) {
      //     emit(state.copyWith(isForceUpdate: true, message: r.message ?? ''));
      //   }
      // });

      // Check if the user is logged in.
      if (auth.currentUser != null) {
        emit(state.copyWith(
          isLoading: false,
          isToken: true,
        ));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            isToken: false,
          ),
        );
      }
    });
  }
}
