import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:whizapp/controller/authentication/user_data_collection_controller.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/asset/image.dart';
import 'package:whizapp/core/them/color.dart';
import 'package:whizapp/view/common_widgets/button_widget.dart';
import 'package:whizapp/view/login/login_page.dart';

import 'package:whizapp/view/login/widget/mobile_inputfield.dart';
import 'package:whizapp/view/main/main_page.dart';

class UserDataCollectorPage extends StatelessWidget {
  const UserDataCollectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataCollectorController userDataController =
        Get.put(UserDataCollectorController());
    return Scaffold(
      backgroundColor: AppColor.primeryLight,
      body: SafeArea(
        child: SingleChildScrollView(


          child: Form(
            key: userDataController.formGlobalKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "One more step to go ...",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 30),
                ),
                Image.asset(
                  AppImg.charactor1,
                  height: 300,
                  width: double.maxFinite,
                ),
                TextFieldWidget(
                  hintText: "Student Name",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  textEditingController: userDataController.nameController,
                  onChanged: (String value) {},
                  onSaved: (value) {},
                  validate: (value) =>
                      userDataController.nameController.value.text.isEmpty
                          ? "Empty Field"
                          : null,
                  labelText: 'Student Name',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CupertinoPickerClassField(),
                const CupertinoDobPickerField(
            
                ),
                ButtonWidget(
                    bgColor: AppColor.backgroundLight,
                    fgColor: AppColor.primeryLight,
                    name: "Submit",
                    onPressed: () {
                      userDataController.formGlobalKey.currentState!.validate();
                      log(userDataController.formGlobalKey.currentState!
                          .validate()
                          .toString());
                      log(userDataController.nameController.text.toString());
                    })
              ],
            ),

          ),
        ),
      ),
    );
  }
}

class CupertinoPickerClassField extends StatelessWidget {
  const CupertinoPickerClassField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    UserDataCollectorController userDataController =
        Get.find<UserDataCollectorController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => TextFormField(
          validator: (value) {
            if (userDataController.currentStandard.isEmpty) {
              return "Please Select Student class";
            } else {
              return null;
            }
          },
          readOnly: true,
          onTap: () => showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                title: Obx(
                 ()=>Text(userDataController.currentStandard.value,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                actions: [
                  SizedBox(
                    height: 300,
                    child: CupertinoPicker(
                        itemExtent: 42,
                        looping: true,
                        magnification: 1.2,
                        scrollController:
                            userDataController.classScrollController,
                        onSelectedItemChanged: (value) {
                          userDataController.currentStandard(
                              userDataController.classes[value]);
                          userDataController.classScrollController =
                              FixedExtentScrollController(initialItem: value);
                          userDataController.formGlobalKey.currentState!
                              .validate();
                        },
                        children: userDataController.classes
                            .map((myClass) => Center(
                                  child: Text(myClass),
                                ))
                            .toList()),
                  )
                ],
              );
            },
          ),
          decoration: InputDecoration(
              filled: true,
              hintText: userDataController.currentStandard.value.isEmpty
                  ? "Tap to select student Class"
                  : userDataController.currentStandard.value,
              hintStyle: const TextStyle(color: AppColor.backgroundLight),
              fillColor: AppColor.whiteLight.withOpacity(0.1),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.textwhiteLight.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              prefixIcon: SizedBox(
                  height: 30,
                  child: SvgPicture.asset(AppICons.arrowDownCircle))),
        ),
      ),
    );
  }
}

class CupertinoDobPickerField extends StatelessWidget {
  const CupertinoDobPickerField({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    UserDataCollectorController userDataController =
        Get.find<UserDataCollectorController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => TextFormField(
          validator: (value) {
            if (userDataController.currentDob.isEmpty) {
              return "Please Select Student class";
            } else {
              return null;
            }
          },
          readOnly: true,
          onTap: () => showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                title: Obx(
                 ()=> Text(userDataController.currentDob.value ,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                actions: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                      maximumDate: DateTime.now(),
                      dateOrder: DatePickerDateOrder.dmy,
                      initialDateTime: DateTime(
                        DateTime.now().year,
                        // ignore: prefer_interpolation_to_compose_strings
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime value) {
                        userDataController.currentDob(
                            "${value.day.toString().length < 2 ? "0${value.day}" : value.day}-${value.month.toString().length < 2 ? "0${value.month}" : value.month}-${value.year}");
                        userDataController.formGlobalKey.currentState!
                            .validate();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          decoration: InputDecoration(
              filled: true,
              hintText: userDataController.currentDob.value.isEmpty
                  ? "Tap to select student Date of birth"
                  : userDataController.currentDob.value,
              hintStyle: const TextStyle(color: AppColor.backgroundLight),
              fillColor: AppColor.whiteLight.withOpacity(0.1),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColor.textwhiteLight.withOpacity(0.3), width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              prefixIcon: SizedBox(
                  height: 30,
                  child: SvgPicture.asset(AppICons.arrowDownCircle))),
        ),
      ),
    );
  }
}
