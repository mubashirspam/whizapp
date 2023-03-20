import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whizapp/core/asset/icons.dart';
import 'package:whizapp/core/theme/color.dart';

class CustomTextField extends StatelessWidget {
final  void Function(String)? onChanged;
  const CustomTextField({
    Key? key,required this.onChanged
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
      padding:const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.whiteLight,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color:  AppColor.secondaryLight 
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
             onChanged:onChanged,
           onTapOutside: (event) {
             FocusManager.instance.primaryFocus?.unfocus();
           },
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
