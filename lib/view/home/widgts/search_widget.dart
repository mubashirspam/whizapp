import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/them/color.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
      padding:const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.whiteLight,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: _isFocused ? AppColor.secondaryLight : AppColor.primeryLight,
        ),
      ),
      child: Row(
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
                focusNode: _focusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'search..',
                  hintStyle: TextStyle(
                      color: AppColor.textSecondaryLight,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppICons.filter
                // color: _isFocused ? Colors.blue : Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
