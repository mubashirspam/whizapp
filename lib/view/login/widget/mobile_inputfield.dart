import 'package:flutter/material.dart';
import 'package:whizapp/core/them/color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final Function(String value) onChanged;
  final Function(dynamic value) onSaved;
final Function()? onTap;
  final String? Function(String?)? validate;
final AutovalidateMode? autoValidateMode;
  final Widget? prefix;
final String labelText;
  // final void Function (String value) onSaved;

  const TextFieldWidget({
    super.key,
    this.onTap,
    this.autoValidateMode,
    this.prefixIcon,
    required this.hintText,
    required this.keyboardType,
     this.textEditingController,
    required this.onChanged,
    required this.onSaved,
    required this.validate,
    required this.labelText,
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
            child: TextFormField(
          controller: textEditingController,
          autovalidateMode: autoValidateMode,
              onTap: onTap,
              cursorColor: AppColor.whiteLight,
              keyboardType: keyboardType,
              decoration: InputDecoration(
        
                labelText: labelText,
                
                labelStyle: const TextStyle(
                  color: AppColor.whiteLight,
                ),
                prefix: prefix,
                
                prefixIcon: prefixIcon,
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
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColor.whiteLight, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: AppColor.textwhiteLight,
                   /*  fontWeight: FontWeight.w200 */),
              ),
              onChanged: onChanged,
              onSaved: onSaved,
              validator: validate,
            ),
          ),
        ),
      ],
    );
  }
}
