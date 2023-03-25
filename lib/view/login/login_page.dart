import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/controller/authentication/country_controller.dart';

import 'package:whizapp/core/theme/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';

import 'package:whizapp/view/login/user_data_collector_page.dart';
import 'package:whizapp/view/login/widget/mobile_inputfield.dart';
import 'package:whizapp/view/login/widget/otp_widget.dart';
import 'package:whizapp/view/main/main_page.dart';

import '../../model/user/user_model.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  final TextEditingController _mobileController = TextEditingController();
  final countryController = Get.put(CountryController());

  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  final List<Map<String, dynamic>> countryList = [
    {'name': 'india', 'dial_code': '+91'},
    {'name': 'Albania', 'dial_code': '+355'},
    {'name': 'Algeria', 'dial_code': '+213'},
    {'name': 'American Samoa', 'dial_code': '+1 684'},
    {'name': 'Andorra', 'dial_code': '+376'},
    {'name': 'Angola', 'dial_code': '+244'},
    // Add more countries here...
  ];

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    return controller.obx(
      (userModel) {
        if (userModel != null) {
          return MainPage();
        } else {
          return UserDataCollectorPage(
              user: authController.firebaseUser.value as User);
        }
      },
      onLoading: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onEmpty: Scaffold(
        backgroundColor: AppColor.primeryLight,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-1, -1),
                tileMode: TileMode.clamp,
                radius: 1,
                colors: [
                  Color(0xff8A77F0),
                  AppColor.primeryLight,
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Obx(() => authController.isOtpSent.value
                      ? const Text(
                          "Verification",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  const SizedBox(height: 15),
                  Obx(() => authController.isOtpSent.value
                      ? const Text(
                          " Enter your OTP code number",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : const Text(
                          " We're glad to have you back. Please enter your mobile number to proceed.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  const SizedBox(height: 50),
                  Obx(
                    () => authController.isOtpSent.value
                        ? OtpWidget(
                            controllers: _controllers,
                          )
                        : TextFieldWidget(
                            hintText: "mobile",
                            labelText: 'Mobile number',
                            keyboardType: TextInputType.phone,
                            textEditingController: _mobileController,
                            prefix: GestureDetector(
                              onTap: () => countryController
                                  .showDialog(_buildBottomPicker()),
                              child: Text(
                                countryList[countryController
                                    .selectedCountryCode.value]["dial_code"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              authController.phoneNo.value = value;
                            },
                            onSaved: (val) => authController.phoneNo.value =
                                countryList[countryController
                                        .selectedCountryCode
                                        .value]["dial_code"] +
                                    val!,
                            validate: (val) => (val!.isEmpty || val.length < 10)
                                ? "Enter valid number"
                                : null,
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Obx(
                    () => Text(
                      authController.statusMessage.value,
                      style: const TextStyle(
                          color: AppColor.whiteLight,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => authController.isOtpSent.value
                              ? Column(
                                  children: [
                                    authController.resendOTP.value
                                        ? ButtonWidget(
                                            name: 'Resend otp',
                                            bgColor: AppColor.backgroundLight,
                                            fgColor: AppColor.primeryLight,
                                            onPressed: () async {
                                              await authController.resendOtp();
                                            },
                                          )
                                        : Text(
                                            "Resend otp : ${authController.resendAfter}"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    authController.isVerifyButtonStatus.value
                                        ? const SizedBox()
                                        : ButtonWidget(
                                            name: "verify",
                                            onPressed: () async {
                                              log("button pressed verify -88888888888888888888");
                                              authController.otp.value = "";
                                              for (var controller
                                                  in _controllers) {
                                                authController.otp.value +=
                                                    controller.text;
                                              }
                                              await authController.verifyOTP();
                                            },
                                            bgColor: AppColor.whiteLight,
                                            fgColor: AppColor.textVilotLight,
                                          ),
                                  ],
                                )
                              : ButtonWidget(
                                  name: authController.isSendingOTP.value
                                      ? "sending..."
                                      : "Send OTP",
                                  onPressed: authController.isSendingOTP.value
                                      ? null
                                      : () {
                                          final form = _formKey.currentState;
                                          if (form!.validate()) {
                                            form.save();
                                            authController.getOtp();
                                          }
                                        },
                                  bgColor: AppColor.whiteLight,
                                  fgColor: AppColor.textVilotLight,
                                ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPicker() {
    return Container(
      height: 250.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: CupertinoPicker(
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        itemExtent: 32,
        // This is called when selected item is changed.
        onSelectedItemChanged: (int selectedItem) {
          countryController.selectedCountryCode.value = selectedItem;
        },
        children: List<Widget>.generate(
          countryList.length,
          (int index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        countryList[index]["name"],
                      ),
                      Text(
                        countryList[index]["dial_code"],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
