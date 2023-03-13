import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/login/login_page.dart';

import 'package:whizapp/view/login/widget/mobile_inputfield.dart';
import 'package:whizapp/view/main/main_page.dart';

class UserDataCollectorPage extends StatelessWidget {
  const UserDataCollectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primeryLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 125,
              ),
              TextFieldWidget(
                hintText: "Student Name",
                keyboardType: TextInputType.name,
                textEditingController: TextEditingController(),
                onChanged: (String value) {},
                onSaved: (value) {},
                validate: (value) {},
                labelText: 'Student Name',
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  readOnly: true,
                  onTap: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        actions: [cupertinoPopUp()],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Tap to select student's Standard",
                      hintStyle: TextStyle(color: AppColor.backgroundLight),
                      fillColor: AppColor.whiteLight.withOpacity(0.1),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColor.textwhiteLight.withOpacity(0.3),
                            width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Column(
                        children: [
                          Icon(
                            Icons.arrow_upward_sharp,
                            color: AppColor.backgroundLight,
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: AppColor.backgroundLight,
                          )
                        ],
                      )),
                ),
              ),
              ButtonWidget(
                  name: "next",
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainPage(),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox cupertinoPopUp() {
    return SizedBox(
      height: 400,
      child: CupertinoPicker(
          itemExtent: 62,
          onSelectedItemChanged: (value) {},
          children: List.generate(8, (index) => Center(child: Text("ggdgd")))),
    );
  }
}
