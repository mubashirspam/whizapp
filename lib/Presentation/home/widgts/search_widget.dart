import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  const CustomTextField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AppICons.search

              // color: _isFocused ? Colors.blue : Colors.grey,
              ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              onChanged: onChanged,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  fillColor: AppColor.backgroundLight,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'search..',
                  hintStyle: const TextStyle(
                      color: AppColor.textSecondaryLight,
                      fontWeight: FontWeight.w200),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      AppICons.filter,
                      width: 2,
                      height: 2,
                    ),
                  ),
                  suffixIconConstraints:
                      BoxConstraints.tight(const Size.fromRadius(20))),
            ),
          ),
        ),
      ],
    );
  }
}
