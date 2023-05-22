import 'package:flutter/material.dart';
import 'package:whizapp/core/theme/color.dart';

class TextFieldWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final Function(String value) onChanged;
  final Function(dynamic value) onSaved;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final AutovalidateMode? autoValidateMode;
  final Widget? prefix;
  final Widget? suffixIcon;
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
    this.obscureText,
    this.suffixIcon,
    this.prefix,

    // required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: obscureText ?? false,
            controller: textEditingController,
            autovalidateMode: autoValidateMode,
            onTap: onTap,
            cursorColor: AppColor.textPrimeryLight,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(
                  color: AppColor.textSecondaryLight,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
              prefix: prefix,
              prefixIcon: prefixIcon,

              suffixIcon: suffixIcon,
              filled: true,
              fillColor: AppColor.backgroundLight,
              enabled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColor.primeryLight, width: 1),
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
              // hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColor
                    .textPrimeryLight, /*  fontWeight: FontWeight.w200 */
              ),
            ),
            onChanged: onChanged,
            onSaved: onSaved,
            validator: validate,
          ),
        ),
      ],
    );
  }
}
