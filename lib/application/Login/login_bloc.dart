import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  FirebaseAuth auth = FirebaseAuth.instance;

  LoginBloc() : super(LoginState.initial()) {
    // on<_GetOtp>((event, emit) async {
    //   log("otp called");
    //   emit(
    //     state.copyWith(
    //       isLoading: true,
    //       hasOtpData: false,
    //       coundownTime: 30,
    //     ),
    //   );

    //   try {
    //     log("try called");

    //     await auth.verifyPhoneNumber(
    //       phoneNumber: event.phone.toString(),
    //       verificationCompleted: (PhoneAuthCredential credential) {
    //         log("OTP sent to ${credential}");
    //         auth.signInWithCredential(credential);
    //       },
    //       verificationFailed: (FirebaseAuthException e) {
    //         log(e.message.toString());
    //         emit(
    //           state.copyWith(
    //               isLoading: false,
    //               isError: true,
    //               coundownTime: 0,
    //               statusMessage: "${e.message}"),
    //         );
    //       },
    //       codeSent: (String verificationId, int? resendToken) {
    //         emit(
    //           state.copyWith(
    //             isLoading: false,
    //             isError: false,
    //             verificationId: verificationId,
    //             statusMessage: "OTP sent to ${event.phone}",
    //           ),
    //         );
    //         log("OTP sent to ${event.phone}");
    //       },
    //       codeAutoRetrievalTimeout: (String verificationId) {},
    //     );
    //   } on FirebaseAuthException catch (e) {
    //     log(e.message.toString());

    //     emit(
    //       state.copyWith(
    //           isLoading: false,
    //           isError: true,
    //           coundownTime: 0,
    //           statusMessage: "${e.message}"),
    //     );
    //   }
    // });

    // on<_OptValidation>(
    //   (event, emit) async {
    //     emit(
    //       state.copyWith(
    //         isLoading: true,
    //         hasOtpData: false,
    //       ),
    //     );

    //     try {
    //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //           verificationId: state.verificationId!,
    //           smsCode: event.otp.toString());
    //       await auth.signInWithCredential(credential);
    //       emit(
    //         state.copyWith(
    //           isLoading: false,
    //           hasOtpData: true,
    //         ),
    //       );
    //     } on FirebaseAuthException catch (error) {
    //       emit(
    //         state.copyWith(
    //             isLoading: false,
    //             hasOtpData: false,
    //             isError: true,
    //             statusMessage: "${error.message}"),
    //       );
    //     }
    //   },
    // );

    on<_LogOut>((event, emit) async {
      await auth.signOut();
      emit(
        state.copyWith(
          hasOtpData: false,
        ),
      );
    });

// USing EMAil

    on<_EmailLogin>(
      (event, emit) async {
        emit(
          state.copyWith(
            isError: false,
            isLoading: true,
          ),
        );
        try {
          UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(
            state.copyWith(
                isLoading: false,
                isError: false,
                hasOtpData: true,
                statusMessage: "You are successfully logged in 🤩👋"),
          );
        } on FirebaseAuthException catch (e) {
          log(e.message.toString());
          if (e.code == 'user-not-found') {
            emit(
              state.copyWith(
                  isLoading: false,
                  isError: true,
                  hasOtpData: false,
                  statusMessage: 'No account found for this email 🫠'),
            );
            log('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            emit(
              state.copyWith(
                  isLoading: false,
                  isError: true,
                  hasOtpData: false,
                  statusMessage: "password doesn't match this mail id 😵"),
            );
            log('Wrong password provided for that user.');
          } else {
            emit(
              state.copyWith(
                  isLoading: false,
                  isError: true,
                  hasOtpData: false,
                  statusMessage: e.message),
            );
          }
        }
      },
    );

    on<_EmailRegister>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        try {
          UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(
            state.copyWith(
                isLoading: false,
                isError: false,
                hasOtpData: true,
                statusMessage: "User Logined Successfully"),
          );
        } on FirebaseAuthException catch (e) {
          log(e.message.toString());
          if (e.code == 'user-not-found') {
            emit(
              state.copyWith(
                  isLoading: false,
                  isError: true,
                  hasOtpData: false,
                  statusMessage: 'No user found for that email.'),
            );
            log('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            emit(
              state.copyWith(
                  isLoading: false,
                  isError: true,
                  hasOtpData: false,
                  statusMessage: 'Wrong password provided for that user.'),
            );
            log('Wrong password provided for that user.');
          }
        }
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
      },
    );
  }
}
