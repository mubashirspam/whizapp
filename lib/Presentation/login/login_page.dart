import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/Presentation/common_widget/button_widget.dart';
import 'package:whizapp/Presentation/initialize.dart';
import 'package:whizapp/Presentation/login/widget/mobile_inputfield.dart';
import 'package:whizapp/application/Login/login_bloc.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/helper/show_toast.dart';
import 'package:whizapp/core/theme/color.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswoedVisible = true;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteLight,
      ),
      backgroundColor: AppColor.whiteLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.2,
                  ),

                  const Text(
                    "Login to your \nAccount",
                    style: TextStyle(
                      fontSize: 35,
                      color: AppColor.textPrimeryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "We're glad to have you back. Please enter your mobile number to proceed.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.textPrimeryLight,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // TextFieldWidget(
                  //   hintText: "mobile",
                  //   labelText: 'Mobile number',
                  //   keyboardType: TextInputType.phone,
                  //   prefix: GestureDetector(
                  //     onTap: () => _buildBottomPicker(),
                  //     child: Text(
                  //       countryList[0]["dial_code"],
                  //       style: const TextStyle(
                  //         color: AppColor.textPrimeryLight,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  //   onSaved: (value) {},
                  //   onChanged: (value) {},
                  //   validate: (val) => (val!.isEmpty || val.length < 10)
                  //       ? "Enter valid number"
                  //       : null,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      textEditingController: emailController,
                      // prefixIcon:
                      //     SizedBox(child: SvgPicture.asset(AppICons.email, width: 2, height: 2)),
                      hintText: "email",
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                      onChanged: (value) {},
                      validate: (email) {
                        RegExp emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$');

                        if (email!.isEmpty) {
                          return "Enter Your Email";
                        } else if (!emailRegex.hasMatch(email)) {
                          return "Enter Valid Email";
                        }
                        return null;
                      }),

                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      textEditingController: passwordController,
                      suffixIcon: GestureDetector(
                        onTap: () => setState(
                            () => isPasswoedVisible = !isPasswoedVisible),
                        child: Icon(
                          isPasswoedVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: isPasswoedVisible
                              ? AppColor.textSecondaryLight
                              : AppColor.textPrimeryLight,
                        ),
                      ),
                      // prefixIcon: SizedBox(
                      //   child: SvgPicture.asset(AppICons.password,
                      //       width: 2, height: 2),
                      // ),
                      obscureText: isPasswoedVisible,
                      hintText: "Password",
                      labelText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {},
                      onChanged: (value) {},
                      validate: (password) {
                        if (password!.isEmpty) {
                          return "Enter Your Password";
                        } else if (password.length < 6) {
                          return "Password should contain atleast 6 characters";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  // Pinput(
                  //         keyboardType: TextInputType.number,
                  //         length: 6,
                  //         errorTextStyle: const TextStyle(
                  //           fontSize: 12,
                  //           color: AppColor.redDanger,
                  //         ),
                  //         controller: mpinController,
                  //         //forceErrorState: true,

                  //         validator: (value) {
                  //           if (value!.isEmpty || value.length < 6) {
                  //             return 'Enter your otp';
                  //           }
                  //           return null;
                  //         },
                  //         defaultPinTheme: PinTheme(
                  //           width: 50,
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //             color: AppColor.whiteLight.withOpacity(0.1),
                  //             borderRadius: BorderRadius.circular(15),
                  //           ),
                  //         ),
                  //       ),
                  Center(
                    child: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state.hasOtpData && !state.isLoading &&
                            !state.isError) {
                           CustomSnackBar.showSnackBar(
                              context: context,
                              message: state.statusMessage.toString(),
                              );

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const Initialize()),
                              (route) => true);
                        }
                        if (state.isError && !state.isLoading) {
                          CustomSnackBar.showSnackBar(
                              context: context,
                              message: state.statusMessage.toString(),
                              color: AppColor.redDanger);
                        }
                      },
                      builder: (context, state) {
                        return Row(
                          children: [
                            Expanded(
                              child: ButtonWidget(
                                  isLoading: state.isLoading,
                                  bgColor: AppColor.primeryLight,
                                  fgColor: AppColor.textwhiteLight,
                                  name: "Login",
                                  onPressed: () {
                                    if (_formKey.currentState!.validate() &&
                                        !state.isLoading) {
                                      context.read<LoginBloc>().add(
                                          LoginEvent.emailLogin(
                                              email: emailController.value.text
                                                  .trim(),
                                              password: passwordController
                                                  .value.text
                                                  .trim()));
                                    }
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
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
        onSelectedItemChanged: (int selectedItem) {},
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
