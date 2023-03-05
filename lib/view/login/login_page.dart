import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/auth_controller.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/login/widget/mobile_inputfield.dart';
import 'package:whizapp/view/login/widget/otp_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();


    final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
     

  int _selectedCountryCode = 0;

  final List<Map<String, dynamic>> countryList = [
    {'name': 'india', 'dial_code': '+91'},
    {'name': 'Albania', 'dial_code': '+355'},
    {'name': 'Algeria', 'dial_code': '+213'},
    {'name': 'American Samoa', 'dial_code': '+1 684'},
    {'name': 'Andorra', 'dial_code': '+376'},
    {'name': 'Angola', 'dial_code': '+244'},
    // Add more countries here...
  ];

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primeryLight,
      body: Container(
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
              const SizedBox(height: 150),
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
                    ?  OtpWidget(controllers: _controllers,)
                    : TextFieldWidget(
                        hintText: "mobile",
                        keyboardType: TextInputType.phone,
                        textEditingController: _mobileController,
                        prefix: GestureDetector(
                          onTap: () => _showDialog(_buildBottomPicker()),
                          child: Text(
                            countryList[_selectedCountryCode]["dial_code"],
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
                            countryList[_selectedCountryCode]["dial_code"] +
                                val!,
                        validate: (val) => (val!.isEmpty || val.length < 10)
                            ? "Enter valid number"
                            : null,
                      ),
              ),


              Text(
                authController.statusMessage.value,
                style: TextStyle(
                    color: authController.statusMessageColor.value,
                    fontWeight: FontWeight.bold),
              ),

              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => authController.isOtpSent.value
                        ? ButtonWidget(
                            name: "varify",
                            onPressed: () {
                              authController.otp.value = "";
                              for (var controller in _controllers) {
                                authController.otp.value += controller.text;
                              }
                              authController.verifyOTP();
                            },
                            bgColor: AppColor.whiteLight,
                            fgColor: AppColor.textVilotLight,
                          )
                        : ButtonWidget(
                            name: "Send OTP",
                            onPressed: () {
                              final form = _formKey.currentState;
                              if (form!.validate()) {
                                form.save();
                                authController.getOtp();
                              }
                            },
                            bgColor: AppColor.whiteLight,
                            fgColor: AppColor.textVilotLight,
                          )),
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
    );
  }

  Widget _buildBottomPicker() {
    return Container(
      height: 250.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: Column(
        children: [
          CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32,
            // This is called when selected item is changed.
            onSelectedItemChanged: (int selectedItem) {
              setState(() {
                _selectedCountryCode = selectedItem;
              });
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
        ],
      ),
    );
  }
}
