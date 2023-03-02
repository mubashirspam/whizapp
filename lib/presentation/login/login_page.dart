import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/presentation/common_widgets/button_widget.dart';
import 'package:whizapp/presentation/login/widget/mobile_inputfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
 

  int _selectedCountryCode = 0;

  final List<Map<String, dynamic>> countryList = [
    {'name': 'Afghanistan', 'dial_code': '+93'},
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            const Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              " We're glad to have you back. Please enter your mobile number to proceed.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 50),
            TextFieldWidget(
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
              onChanged: (value) {},
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    name: "Send OTP",
                    onPressed: () {},
                    bgColor: AppColor.whiteLight,
                    fgColor: AppColor.textVilotLight,
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
    );
  }

  Widget _buildBottomPicker() {
    return Container(
      height: 250.0,
      padding: EdgeInsets.only(top: 6.0),
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
