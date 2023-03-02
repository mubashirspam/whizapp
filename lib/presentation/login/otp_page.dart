import 'package:flutter/material.dart';
import 'package:whizapp/presentation/common_widgets/button_widget.dart';
import 'package:whizapp/presentation/login/widget/mobile_inputfield.dart';
import 'package:whizapp/presentation/login/widget/otp_widget.dart';

import '../../core/them/color.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  // final ValueChanged<String>? onCompleted;

  final TextEditingController _OTPController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   children: const [
            //     OtpFiled(),
            //     SizedBox(width: 5),
            //     OtpFiled(),
            //     SizedBox(width: 5),
            //     OtpFiled(),
            //     SizedBox(width: 5),
            //     OtpFiled(),
            //     SizedBox(width: 5),
            //     OtpFiled(),
            //     SizedBox(width: 5),
            //     OtpFiled()
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
   const  OtpWidget(),
            
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    name: "Submit Otp",
                    onPressed: () {},
                    bgColor: AppColor.whiteLight,
                    fgColor: AppColor.textVilotLight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
