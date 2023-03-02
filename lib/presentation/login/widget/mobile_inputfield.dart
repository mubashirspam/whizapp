import 'package:flutter/material.dart';
import 'package:whizapp/core/them/color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController textEditingController;
  final Function(String value) onChanged;
  final Widget? prefix;

  // final void Function (String value) onSaved;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.textEditingController,
    required this.onChanged,
    this.prefix,

    // required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
            TextFormField(
              cursorColor: AppColor.whiteLight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Number",
                labelStyle: const TextStyle(
                  color: AppColor.whiteLight,
                ),
                prefix: prefix,
                filled: true,
                fillColor: AppColor.whiteLight.withOpacity(0.1),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.textwhiteLight.withOpacity(0.3),
                      width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColor.whiteLight, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: AppColor.textSecondaryLight,
                    fontWeight: FontWeight.w200),
              ),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
